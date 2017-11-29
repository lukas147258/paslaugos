<?php
use yii\helpers\Url;
?>
<div class="services-default-index">
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <h1><i class="glyphicon glyphicon-list-alt fa-lg"></i></h1>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge"><?= $allServicesCount ?></div>
                            <div>Paslaugos</div>
                        </div>
                    </div>
                </div>
                <a href="<?= Url::to(['/services/services']) ?>">
                    <div class="panel-footer">
                        <span class="pull-left">Žiūrėti</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
    </div>
    <!-- /.row -->
</div>
