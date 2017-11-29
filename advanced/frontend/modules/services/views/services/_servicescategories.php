<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel frontend\modules\services\models\ServicesCategoriesSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
?>
<div class="services-categories-index">

    <?php Pjax::begin(); ?>    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            [
                'attribute'=>'title',
                'value'=>'service.title',
            ],
            // 'service_id',
            'name',
            'description',
            //'updated_at',
            // 'created_at',
        ],
    ]); ?>
    <?php Pjax::end(); ?></div>
