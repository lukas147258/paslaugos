<?php

namespace frontend\modules\services\controllers;

use Yii;
use yii\web\Controller;
use frontend\modules\services\models\Services;
use yii\web\ForbiddenHttpException;

/**
 * Default controller for the `services` module
 */
class DefaultController extends Controller
{
    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {
        if (!Yii::$app->user->isGuest) {
            $allServicesCount = Services::find()
                ->where(['user_id' => Yii::$app->user->getId()])
                ->count();

            return $this->render('index', [
                'allServicesCount' => $allServicesCount
            ]);
        } else {
            throw new ForbiddenHttpException;
        }
    }
}
