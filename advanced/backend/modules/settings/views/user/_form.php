<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\User */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="user-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'first_name')->textInput(['autofocus' => true]) ?>

    <?= $form->field($model, 'last_name')->textInput() ?>

    <?= $form->field($model, 'status')->dropDownList(
            [
                10 => 'Active',
                0 => 'Inactive'
            ],
            ['prompt' => 'Statusas']
        ) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Sukurti' : 'Atnaujinti', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
