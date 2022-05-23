$(function () {

    // 確認付款方式
    $("#payWay").change(function () {
        console.log($(this).val())
        $(this).val()
        if ($(this).val() == 1) {
            $("#creditPk").css("display", "none")
        } else {
            $("#creditPk").css("display", "block")
        }
    })



    // 訂單
    // private Integer orderPrice;
    // private Integer paymentType;
    // private String address;



    // 細節
    // private Integer skuID;
    // private String prodName; O
    // private Integer prodNum;  
    // private Integer prodPrice;  

    // 結帳
    $(document).on("click", "#takeOrder", function () {

        let paymentType = null;
        let address = null;
        let orderPrice = null

        let skuIDArr = [];

        //訂單  paymentType;
        paymentType = $("#payWay").val();
        console.log(paymentType);
        //訂單  orderPrice;
        orderPrice = $(".total").text();
        console.log(orderPrice);
        //訂單  address;
        address = $("#address").val();
        if (address == null || address == "") {
            console.log("地址沒填")
        }
        console.log(address);
        // 訂單明細 skuID[]
        $(".skuID").each(function (index, item) {
            skuIDArr.push($(item).val());
        })
        console.log(skuIDArr);

        let ordersVO = {
            orderID: null,
            memID: null,
            createTime: null,
            orderPrice: orderPrice,
            orderStatus:0,
            paymentType:paymentType,
            address:address
        }
        let data = {
            action: "takeOrder",
            ordersVO:ordersVO,
            skuIDArr: skuIDArr
        }

        if(skuIDArr.length==0||skuIDArr.length==null){

        swal({
            title: "錯誤",
            icon: "warning",
            timer: 1000,
            dangerMode: true,
            
          });
          return;
        }

        // action takeOrder

        fetch("/Adopets/shCartAction", {
            method: 'POST',
            body: JSON.stringify(data)
        }).then(response => response.text())
        .then(text=>{
            $("#xxx").html(text);

            return;
        }) 

        
            // 串金流 先擋一下

           

         
        
        // 轉送
        swal({
            title: "購買成功 感謝您！！",
            icon: "success",
            timer: 1500,
          }).then(function(){
            // 不給前一頁
            // 金流測驗
            // window.history.replaceState(null, "", '/Adopets/comAction?action=ecoMainP');
            // window.history.go(0);

          })
       





    })


})