<?php

namespace backend\modules\settings\controllers;

use phpDocumentor\Reflection\Types\Array_;
use Yii;
use common\models\User;
use backend\modules\settings\models\user\UserSearch;
use backend\modules\settings\models\authorization\AuthItem;
use backend\modules\settings\models\authorization\AuthAssignment;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\ForbiddenHttpException;

/**
 * UserController implements the CRUD actions for User model.
 */
class UserController extends Controller
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
     * Lists all User models.
     * @return mixed
     */
    public function actionIndex()
    {
        if(Yii::$app->user->can('view-user-list')) {
            $searchModel = new UserSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

            return $this->render('index', [
                'searchModel' => $searchModel,
                'dataProvider' => $dataProvider,
            ]);
        } else {
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Displays a single User model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        if(Yii::$app->user->can('users-profile')) {
            $permissions = AuthItem::find()->all();
            $userPermissions = AuthAssignment::find()->select('item_name')->where(['user_id' => $id])->all();

            if (Yii::$app->request->post()) {
                $userPermissionsArray = array();

                foreach ($userPermissions as $permissionName) {
                    $userPermissionsArray[] = $permissionName->item_name;
                    $userPermissions = $userPermissionsArray;
                }

                // Add new Permission
                if (Yii::$app->request->post('to')) {
                    $to = Yii::$app->request->post('to');
                    foreach ($to as $name) {
                        $model = new AuthAssignment();
                        if (!in_array($name, $userPermissions)) {
                            $model->item_name = $name;
                            $model->user_id = $id;
                            $model->save();
                        }
                    }
                }

                // Delete Old Permission
                if (Yii::$app->request->post('from')) {
                    $from = Yii::$app->request->post('from');
                    foreach ($from as $deletePermission) {
                        // query against the master
                        Yii::$app->db->createCommand("
                           DELETE FROM `auth_assignment` 
                           WHERE `item_name` = '" . $deletePermission . "'
                           AND user_id = " . $id . "
                    ")->execute();
                    }
                }
                $userPermissions = AuthAssignment::find()->select('item_name')->where(['user_id' => $id])->all();

                return $this->redirect(['view', 'id' => $id]);
            }

            return $this->render('view', [
                'model' => $this->findModel($id),
                'permissions' => $permissions,
                'userPermissions' => $userPermissions,
            ]);
        } else {
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Updates an existing User model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing User model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the User model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return User the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = User::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
