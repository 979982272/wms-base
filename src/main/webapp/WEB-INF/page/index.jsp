<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/view/common/taglib.jspf" %>
<p:head/>
<%@include file="/WEB-INF/view/common/kendo.jspf" %>
<body class="k-widget" style="overflow: hidden;">
<%--<db:grid gridNo="toolMaintenanceGrid"/>--%>
<div id="topPane" style="overflow: hidden;border: 0px;">
    <nav class="k-header k-grid-toolbar">
        <ps:button name="opSave" label="保存" spriteCssClass="fa icon-save" click="opSave();"/>
    </nav>
</div>
<div id="toolMaintenanceGrid" style="height: 100%"></div>
</body>
<p:footer/>

<script type="text/javascript">

    $(function () {
        var height = document.documentElement.clientHeight - 20;
        $("#toolMaintenanceGrid").height(height);
        $("#toolMaintenanceGrid").kendoGrid({
            columns: [
                {field: "partRecordId", title: "工具编码"},
                {field: "partName", title: "工具名称"},
                {field: "qtyBrand", title: "品牌店", template: fmtQtyBrand,width:120},
                {field: "qtyFlagship", title: "旗舰店",template: fmtQtyFlagship,width:120},
                {field: "qtyMaintenance", title: "维修工厂",template: fmtQtyMaintenance,width:120},
                {field: "qtyIntegrated", title: "综合店",template: fmtQtyIntegrated,width:120},
                {field: "normalPrice", title: "单价", filterable: false}
            ],
            dataSource: {
                schema: {
                    model: {
                        fields: {
                            qtyBrand: {type: "number"},
                            qtyFlagship: {type: "number"},
                            qtyMaintenance: {type: "number"},
                            qtyIntegrated: {type: "number"}
                        }
                    },
                    total: "total",
                    data: "data",
                    groups: "data",
                    aggregates: "aggregates",
                    type: "json",
                    errors: "errors"
                },
                serverPaging: true,
                serverFiltering: true,
                serverSorting: true,
                pageSize: 20,
                page: 1,
                transport: {
                    read: {
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json",
                        url: "/station/info/toolNettype/list"
                    }, parameterMap: function (e) {
                        return JSON.stringify(e);
                    }
                }
            },
            filterable: {
                mode: "row,menu",
                operators: {
                    number: {
                        eq: "等于",
                        neq: "不等于",
                        gt: "大于",
                        gte: "大于等于",
                        lt: "小于",
                        lte: "小于等于"
                    }
                }
            }
        });
    })

    /*
     *格式化品牌店数量输入框
     */
    function fmtQtyBrand(dataItem) {
        return formatNumberbox(dataItem, "qtyBrand", "toolMaintenanceGrid");
    }


    /**
     * 旗舰店数量QTY_FLAGSHIP
     * @param dataItem
     * @returns {string}
     * @constructor
     */
    function fmtQtyFlagship(dataItem) {
        return formatNumberbox(dataItem, "qtyFlagship", "toolMaintenanceGrid");
    }


    /**
     * 维修工厂数量 QTY_MAINTENANCE
     * @param dataItem
     * @returns {string}
     */
    function fmtQtyMaintenance(dataItem) {
        return formatNumberbox(dataItem, "qtyMaintenance", "toolMaintenanceGrid");
    }


    /**
     * 综合店数量 QTY_INTEGRATED
     * @param dataItem
     * @returns {string}
     */
    function fmtQtyIntegrated(dataItem) {
        return formatNumberbox(dataItem, "qtyIntegrated", "toolMaintenanceGrid");
    }


    /**
     * 保存
     */
    function opSave() {
        var partRecordId = [];
        var qtyBrands = [];
        var qtyFlagships = [];
        var qtyMaintenances = [];
        var qtyIntegrateds = [];

        var data = $("#toolMaintenanceGrid").data("kendoGrid").dataSource;
        for (var i = 0; i < data.data().length; i++) {
            var currentDataItem = data.at(i);
            partRecordId.push(currentDataItem.partRecordId);

            var qtyBrand = currentDataItem.qtyBrand;
            var qtyFlagship = currentDataItem.qtyFlagship;
            var qtyMaintenance = currentDataItem.qtyMaintenance;
            var qtyIntegrated = currentDataItem.qtyIntegrated;

            qtyBrands.push(qtyBrand);
            qtyFlagships.push(qtyFlagship);
            qtyMaintenances.push(qtyMaintenance);
            qtyIntegrateds.push(qtyIntegrated);
        }

        var $params = "partRecordId=" + partRecordId + "&qtyBrands=" + qtyBrands + "&qtyFlagships=" +
                qtyFlagships + "&qtyMaintenances=" + qtyMaintenances + "&qtyIntegrateds=" + qtyIntegrateds;
        $.ajax({
            url: ctx + "/station/info/toolNettype/batchSave",
            data: $params,
            type: "POST",
            dataType: "json",
            success: function (data) {
                if (data.status == false) {
                    $.core.showErrorMsg(data.msg);
                } else {
                    $.core.showMsg(data.msg);
                    $.core.refresh("toolMaintenanceGrid");
                }
            }
        });
    }


    function isNull(str) {
        if (null == str || "" == str || undefined == str || "undefined" == str) {
            return true;
        } else {
            return false;
        }
    }


</script>
