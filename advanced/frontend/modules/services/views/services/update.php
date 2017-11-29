<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model frontend\modules\services\models\Services */

$this->title = 'Update Services: ' . $model->title;
$this->params['breadcrumbs'][] = ['label' => 'Services', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Atnaujinti';
?>
<div class="services-update">

    <h1><?= Html::encode($model->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'modelsServicesCategory' => $modelsServicesCategory,
    ]) ?>

</div>
