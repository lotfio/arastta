<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <a href="<?php echo $generate; ?>" data-toggle="tooltip" title="<?php echo $button_generate; ?>" class="btn btn-default"><i class="fa fa-refresh"></i></a></div>
            <h1><?php echo $heading_title; ?></h1>
        </div>
    </div>
    <div class="container-fluid">
        <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <?php if ($success) { ?>
        <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
                <div class="pull-right">
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_show_filter; ?>" class="btn btn-primary btn-sm" id="showFilter"><i class="fa fa-eye"></i></button>
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_hide_filter; ?>" class="btn btn-primary btn-sm" id="hideFilter"><i class="fa fa-eye-slash"></i></button>
                </div>
            </div>
            <div class="panel-body">
                <div class="well" style="display:none;">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="control-label" for="input-order-id"><?php echo $entry_order_id; ?></label>
                                <input type="text" name="filter_order_id" value="<?php echo $filter_order_id; ?>" placeholder="<?php echo $entry_order_id; ?>" id="input-order-id" class="form-control" />
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="input-invoice-number"><?php echo $entry_invoice_number; ?></label>
                                <input type="text" name="filter_invoice_number" value="<?php echo $filter_invoice_number; ?>" placeholder="<?php echo $entry_invoice_number; ?>" id="input-invoice-number" class="form-control" />
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="control-label" for="input-order-status"><?php echo $entry_order_status; ?></label>
                                <select name="filter_order_status" id="input-order-status" class="form-control">
                                    <option value="*"></option>
                                    <?php if ($filter_order_status == '0') { ?>
                                    <option value="0" selected="selected"><?php echo $text_missing; ?></option>
                                    <?php } else { ?>
                                    <option value="0"><?php echo $text_missing; ?></option>
                                    <?php } ?>
                                    <?php foreach ($order_statuses as $order_status) { ?>
                                    <?php if ($order_status['order_status_id'] == $filter_order_status) { ?>
                                    <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                                    <?php } else { ?>
                                    <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                                    <?php } ?>
                                    <?php } ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="input-customer"><?php echo $entry_customer; ?></label>
                                <input type="text" name="filter_customer" value="<?php echo $filter_customer; ?>" placeholder="<?php echo $entry_customer; ?>" id="input-customer" class="form-control" />
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="control-label" for="input-order-date"><?php echo $entry_order_date; ?></label>
                                <div class="input-group date">
                                    <input type="text" name="filter_order_date" value="<?php echo $filter_order_date; ?>" placeholder="<?php echo $entry_order_date; ?>" data-date-format="YYYY-MM-DD" id="input-order-date" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="input-invoice-date"><?php echo $entry_invoice_date; ?></label>
                                <div class="input-group date">
                                    <input type="text" name="filter_invoice_date" value="<?php echo $filter_invoice_date; ?>" placeholder="<?php echo $entry_invoice_date; ?>" data-date-format="YYYY-MM-DD" id="input-invoice-date" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
                            </div>
                            <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
                        </div>
                    </div>
                </div>
                <form method="post" enctype="multipart/form-data" target="_blank" id="form-order">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <td class="text-right"><?php if ($sort == 'invoice_number') { ?>
                                    <a href="<?php echo $sort_invoice_number; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_invoice_number; ?></a>
                                    <?php } else { ?>
                                    <a href="<?php echo $sort_invoice_number; ?>"><?php echo $column_invoice_number; ?></a>
                                    <?php } ?>
                                </td>
                                <td class="text-left"><?php if ($sort == 'i.invoice_date') { ?>
                                    <a href="<?php echo $sort_invoice_date; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_invoice_date; ?></a>
                                    <?php } else { ?>
                                    <a href="<?php echo $sort_invoice_date; ?>"><?php echo $column_invoice_date; ?></a>
                                    <?php } ?>
                                </td>
                                <td class="text-right"><?php if ($sort == 'o.order_id') { ?>
                                    <a href="<?php echo $sort_order_id; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_order_id; ?></a>
                                    <?php } else { ?>
                                    <a href="<?php echo $sort_order_id; ?>"><?php echo $column_order_id; ?></a>
                                    <?php } ?>
                                </td>
                                <td class="text-left"><?php if ($sort == 'order_date') { ?>
                                    <a href="<?php echo $sort_order_date; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_order_date; ?></a>
                                    <?php } else { ?>
                                    <a href="<?php echo $sort_order_date; ?>"><?php echo $column_order_date; ?></a>
                                    <?php } ?>
                                </td>
                                <td class="text-left"><?php if ($sort == 'customer') { ?>
                                    <a href="<?php echo $sort_customer; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_customer; ?></a>
                                    <?php } else { ?>
                                    <a href="<?php echo $sort_customer; ?>"><?php echo $column_customer; ?></a>
                                    <?php } ?>
                                </td>
                                <td class="text-left"><?php if ($sort == 'status') { ?>
                                    <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                                    <?php } else { ?>
                                    <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                                    <?php } ?>
                                </td>
                                <td class="text-right"><?php if ($sort == 'o.total') { ?>
                                    <a href="<?php echo $sort_total; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_total; ?></a>
                                    <?php } else { ?>
                                    <a href="<?php echo $sort_total; ?>"><?php echo $column_total; ?></a>
                                    <?php } ?>
                                </td>
                                <td class="text-right"><?php echo $column_action; ?></td>
                            </tr>
                            </thead>
                            <tbody>
                            <?php if (!empty($invoices)) { ?>
                            <?php foreach ($invoices as $invoice) { ?>
                            <tr>
                                <td class="text-right"><?php echo $invoice['invoice_number']; ?></td>
                                <td class="text-left"><?php echo $invoice['invoice_date']; ?></td>
                                <td class="text-right"><?php echo $invoice['order_id']; ?></td>
                                <td class="text-left"><?php echo $invoice['order_date']; ?></td>
                                <td class="text-left"><?php echo $invoice['customer']; ?></td>
                                <td class="text-left"><?php echo $invoice['status']; ?></td>
                                <td class="text-right"><?php echo $invoice['total']; ?></td>
                                <td class="text-right">
                                    <a href="<?php echo $invoice['info']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a>
                                    <a href="<?php echo $invoice['email']; ?>" data-toggle="tooltip" title="<?php echo $button_email; ?>" class="btn btn-success"><i class="fa fa-envelope"></i></a>
                                    <a href="<?php echo $invoice['pdf']; ?>" data-toggle="tooltip" title="<?php echo $button_pdf; ?>" class="btn btn-warning"><i class="fa fa-file-pdf-o"></i></a>
                                </td>
                            </tr>
                            <?php } ?>
                            <?php } else { ?>
                            <tr>
                                <td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
                            </tr>
                            <?php } ?>
                            </tbody>
                        </table>
                    </div>
                </form>
                <div class="row">
                    <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                    <div class="col-sm-6 text-right"><?php echo $results; ?></div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript"><!--
    $('#button-filter').on('click', function() {
        url = 'index.php?route=sale/invoice&token=<?php echo $token; ?>';

        var filter_invoice_number = $('input[name=\'filter_invoice_number\']').val();

        if (filter_invoice_number) {
            url += '&filter_invoice_number=' + encodeURIComponent(filter_invoice_number);
        }

        var filter_order_id = $('input[name=\'filter_order_id\']').val();

        if (filter_order_id) {
            url += '&filter_order_id=' + encodeURIComponent(filter_order_id);
        }

        var filter_customer = $('input[name=\'filter_customer\']').val();

        if (filter_customer) {
            url += '&filter_customer=' + encodeURIComponent(filter_customer);
        }

        var filter_order_status = $('select[name=\'filter_order_status\']').val();

        if (filter_order_status != '*') {
            url += '&filter_order_status=' + encodeURIComponent(filter_order_status);
        }

        var filter_order_date = $('input[name=\'filter_order_date\']').val();

        if (filter_order_date) {
            url += '&filter_order_date=' + encodeURIComponent(filter_order_date);
        }

        var filter_invoice_date = $('input[name=\'filter_invoice_date\']').val();

        if (filter_invoice_date) {
            url += '&filter_invoice_date=' + encodeURIComponent(filter_invoice_date);
        }

        location = url;
    });
    //--></script>
    <script type="text/javascript"><!--
    $('input[name=\'filter_customer\']').autocomplete({
        'source': function(request, response) {
            $.ajax({
                url: 'index.php?route=sale/customer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            label: item['name'],
                            value: item['customer_id']
                        }
                    }));
                }
            });
        },
        'select': function(item) {
            $('input[name=\'filter_customer\']').val(item['label']);
        }
    });
    //--></script>
    <script src="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
    <link href="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
    <script type="text/javascript"><!--
    $('.date').datetimepicker({
        pickTime: false
    });
    //--></script></div>
<?php echo $footer; ?>
