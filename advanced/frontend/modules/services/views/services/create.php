<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model frontend\modules\services\models\Services */

$this->title = 'Sukurti paslaugas';
$this->params['breadcrumbs'][] = ['label' => 'Paslaugos', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="services-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'modelsServicesCategory' => $modelsServicesCategory,
    ]) ?>

</div>
