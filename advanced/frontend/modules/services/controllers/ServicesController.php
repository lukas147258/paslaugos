<?php

namespace frontend\modules\services\controllers;

use Yii;
use frontend\modules\services\models\Services;
use frontend\modules\services\models\ServicesSearch;
use frontend\modules\services\models\ServicesCategories;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use frontend\modules\services\models\Model;
use yii\helpers\ArrayHelper;
use yii\web\ForbiddenHttpException;

/**
 * ServicesController implements the CRUD actions for Services model.
 */
class ServicesController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Services models.
     * @return mixed
     */
    public function actionIndex()
    {
        if(!Yii::$app->user->isGuest && Yii::$app->user->can('create-services')) {
            $searchModel = new ServicesSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

            return $this->render('index', [
                'searchModel' => $searchModel,
                'dataProvider' => $dataProvider,
            ]);
        } else {
            throw new ForbiddenHttpException;
        }
    }

    public function actionAllServices()
    {
        if(!Yii::$app->user->isGuest && Yii::$app->user->can('all-services-list')) {
            $searchModel = new ServicesSearch();
            $dataProvider = $searchModel->searchAll(Yii::$app->request->queryParams);

            return $this->render('all-services', [
                'searchModel' => $searchModel,
                'dataProvider' => $dataProvider,
            ]);
        } else {
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Displays a single Services model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        if(!Yii::$app->user->isGuest && Yii::$app->user->can('create-services')) {
            return $this->render('view', [
                'model' => $this->findModel($id),
            ]);
        } else {
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Creates a new Services model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        if(!Yii::$app->user->isGuest && Yii::$app->user->can('create-services')) {
            $model = new Services();
            $modelsServicesCategory = [new ServicesCategories];

            if ($model->load(Yii::$app->request->post())) {
                $modelsServicesCategory = Model::createMultiple(ServicesCategories::classname());
                Model::loadMultiple($modelsServicesCategory, Yii::$app->request->post());

                // validate all models
                $valid = $model->validate();
                $valid = Model::validateMultiple($modelsServicesCategory) && $valid;

                if ($valid) {
                    $transaction = \Yii::$app->db->beginTransaction();
                    try {

                        $model->user_id = Yii::$app->user->getId();
                        $model->updated_at = date('Y-m-d H:m:s');
                        $model->created_at = date('Y-m-d H:m:s');

                        if ($flag = $model->save(false)) {
                            foreach ($modelsServicesCategory as $modelServicesCategory) {
                                $modelServicesCategory->service_id = $model->id;
                                if (!($flag = $modelServicesCategory->save(false))) {
                                    $transaction->rollBack();
                                    break;
                                }
                            }
                        }
                        if ($flag) {
                            $transaction->commit();
                            return $this->redirect(['view', 'id' => $model->id]);
                        }
                    } catch (Exception $e) {
                        $transaction->rollBack();
                    }
                }
            } else {
                return $this->render('create', [
                    'model' => $model,
                    'modelsServicesCategory' => (empty($modelsServicesCategory)) ? [new ServicesCategories] : $modelsServicesCategory
                ]);
            }
        } else {
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Updates an existing Services model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        if(!Yii::$app->user->isGuest) {
            $model = $this->findModel($id);
            $modelsServicesCategory = $model->servicesCategories;

            if($model->user_id === Yii::$app->user->getId() || Yii::$app->user->can('update-users-service')) {
                if ($model->load(Yii::$app->request->post())) {
                    $oldIDs = ArrayHelper::map($modelsServicesCategory, 'id', 'id');
                    $modelsServicesCategory = Model::createMultiple(ServicesCategories::classname(), $modelsServicesCategory);
                    Model::loadMultiple($modelsServicesCategory, Yii::$app->request->post());
                    $deletedIDs = array_diff($oldIDs, array_filter(ArrayHelper::map($modelsServicesCategory, 'id', 'id')));

                    $model->updated_at = date('Y-m-d H:m:s');

                    // ajax validation
                    if (Yii::$app->request->isAjax) {
                        Yii::$app->response->format = Response::FORMAT_JSON;
                        return ArrayHelper::merge(
                            ActiveForm::validateMultiple($modelsServicesCategory),
                            ActiveForm::validate($model)
                        );
                    }

                    // validate all models
                    $valid = $model->validate();
                    $valid = Model::validateMultiple($modelsServicesCategory) && $valid;

                    if ($valid) {
                        $transaction = \Yii::$app->db->beginTransaction();
                        try {
                            if ($flag = $model->save(false)) {
                                if (!empty($deletedIDs)) {
                                    ServicesCategories::deleteAll(['id' => $deletedIDs]);
                                }
                                foreach ($modelsServicesCategory as $modelServicesCategory) {
                                    $modelServicesCategory->service_id = $model->id;
                                    if (!($flag = $modelServicesCategory->save(false))) {
                                        $transaction->rollBack();
                                        break;
                                    }
                                }
                            }
                            if ($flag) {
                                $transaction->commit();
                                return $this->redirect(['view', 'id' => $model->id]);
                            }
                        } catch (Exception $e) {
                            $transaction->rollBack();
                        }
                    }
                } else {
                    return $this->render('update', [
                        'model' => $model,
                        'modelsServicesCategory' => (empty($modelsServicesCategory)) ? [new ServicesCategories] : $modelsServicesCategory
                    ]);
                }
            }else {
                throw new ForbiddenHttpException;
            }
        } else {
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Deletes an existing Services model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        if(!Yii::$app->user->isGuest) {
            ServicesCategories::deleteAll(['service_id' => $id]);
            $this->findModel($id)->delete();

            return $this->redirect(['index']);
        } else {
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Finds the Services model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Services the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Services::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
