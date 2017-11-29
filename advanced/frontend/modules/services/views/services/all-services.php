<?php

use yii\helpers\Html;
use kartik\grid\GridView;
use yii\widgets\Pjax;
use frontend\modules\services\models\ServicesCategoriesSearch;
/* @var $this yii\web\View */
/* @var $searchModel frontend\modules\services\models\ServicesSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Visos paslaugos';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="services-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    <?php Pjax::begin(); ?>    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            [
                'class' => 'kartik\grid\ExpandRowColumn',
                'value' => function($model, $key, $index, $column) {
                    return GridView::ROW_COLLAPSED;
                },
                'detail' => function($model, $key, $index, $column) {
                    $searchModel = new ServicesCategoriesSearch();
                    $searchModel->service_id = $model->id;
                    $dataProvider = $searchModel->searchAll(Yii::$app->request->queryParams);

                    return Yii::$app->controller->renderPartial('_servicescategories', [
                        'searchModel' => $searchModel,
                        'dataProvider' => $dataProvider,
                    ]);
                }
            ],
            ['class' => 'yii\grid\SerialColumn'],

            [
                'attribute'=>'username',
                'value'=>'user.username',
            ],
            'title',
            'description',
            'updated_at',
            // 'created_at',
        ],
    ]); ?>
    <?php Pjax::end(); ?></div>
