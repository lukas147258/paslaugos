<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\User */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Vartotojai', 'url' => ['index']];
?>
    <!-- Tab panes -->
    <div class="tab-content">
            <div class="user-view">

                <?= DetailView::widget([
                    'model' => $model,
                    'attributes' => [
                        'id',
                        'username',
                        'first_name',
                        'last_name',
                        //'auth_key',
                        //'password_hash',
                        //'password_reset_token',
                        'email:email',
                        //'status',
                        //'created_at',
                        //'updated_at',
                    ],
                ]) ?>
            </div>
        <?php if(Yii::$app->user->can('add-permission')) { ?>
                <div class="userPermissionForm">

                    <?php $form = ActiveForm::begin(); ?>

                    <div class="row">
                        <div class="col-xs-5">
                            <select name="from[]" id="multiselect" class="form-control" size="8" multiple="multiple">
                                <?php foreach($permissions as $permission){ ?>
                                    <option value="<?= $permission->name ?>"><?= $permission->name ?></option>
                                <?php } ?>
                            </select>
                        </div>

                        <div class="col-xs-2">
                            <button type="button" id="multiselect_rightAll" class="btn btn-block"><i class="glyphicon glyphicon-forward"></i></button>
                            <button type="button" id="multiselect_rightSelected" class="btn btn-block"><i class="glyphicon glyphicon-chevron-right"></i></button>
                            <button type="button" id="multiselect_leftSelected" class="btn btn-block"><i class="glyphicon glyphicon-chevron-left"></i></button>
                            <button type="button" id="multiselect_leftAll" class="btn btn-block"><i class="glyphicon glyphicon-backward"></i></button>
                        </div>

                        <div class="col-xs-5">
                            <select name="to[]" id="multiselect_to" class="form-control" size="8" multiple="multiple">
                                <?php foreach($userPermissions as $userPermission){?>
                                    <option value="<?= $userPermission->item_name ?>"><?= $userPermission->item_name ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <?= Html::submitButton(Yii::t('app', 'Submit'), ['class' => 'btn btn-primary']) ?>
                    </div>
                    <?php ActiveForm::end(); ?>

                </div><!-- userPermissionForm -->
        </div>
    <?php } ?>
    </div>
    </div>
</div>
