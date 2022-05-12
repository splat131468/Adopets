$(function () {

    //全域變數 控制一次編輯一個


    // 選擇屬性後尋找對應的數量以及價格
    $(document).on("change", "#ck", function () {

        let len = $(".show").length;

        let spuID = $(this).closest("ul").find(".spuID").val();


        let key1 = null;
        key1 = $(this).closest("ul").find("input[name='spec1']:checked").val();


        let attrN2 = 0;
        let key2 = null;
        //抓節點
        let node = $(this);



        // 如果attrN2 == null 就不取
        attrN2 = $(this).closest("div").find(".s2").length;
        console.log(attrN2)
        // 判斷有沒有attrN2
        if (attrN2 != 0) {
            key2 = $(this).closest("div").find("input[name='spec2']:checked").val();
        }





        // 若n2不為null 代表有兩個屬性，需點選兩個才傳請求
        if (attrN2 != 0 && key1 != null && key2 != null) {
            let arr = [key1, key2];
            let data = { arr: arr, action: "getPrcSk", spuID, spuID };


            fetch("http://localhost:8081/Adopets/cartAction", {
                method: 'POST',
                body: JSON.stringify(data)
            }).then(function (response) {
                return response.json();
            }).then(function (res) {

                node.closest("ul").find(".pnum").text(res.stock);
                node.closest("ul").find(".price").text(res.skuPrice);
                node.closest("ul").find(".skuID").val(res.skuID);

            })

        } else if (attrN2 == 0 && key1 != null) {
            let arr = [key1];
            let data = { arr: arr, action: "getPrcSk", spuID, spuID };


            fetch("http://localhost:8081/Adopets/cartAction", {
                method: 'POST',
                body: JSON.stringify(data)
            }).then(function (response) {
                return response.json();
            }).then(function (res) {



                node.closest("ul").find(".pnum").text(res.stock);
                node.closest("ul").find(".price").text(res.skuPrice);
                node.closest("ul").find(".skuID").val(res.skuID);



            })



        }

    });

    // 更改類型
    $(document).on("click", "#updateItem", function () {

        let node = $(this);

        let num = node.closest("tr").prev().find(".qt").val();
        let skuPrice = node.closest("div").find(".price").text();
        let skuID = node.closest("div").find(".skuID").val();
        let spuID = node.closest("div").find(".spuID").val();


        let data = {
            action: "updateCart",
            cartItem: {
                num: num,
                skuPrice: skuPrice,
                skuID: skuID,
                spuID: spuID,
                allAttr: null,
                descript: null

            },

        }


        fetch("http://localhost:8081/Adopets/shCartAction", {
            method: 'POST',
            body: JSON.stringify(data)
        }).then(function (response) {
            return response.json();
        }).then(function (res) {

            console.log(res);
            // 抓到tr 在抓前個兄弟
            node.closest("tr").prev().find(".atrText").text(res.specAttr);
            node.closest("tr").prev().find(".eachPrice").text(res.skuPrice);
            node.closest("tr").prev().find(".rsNum").text("剩餘 ：" + res.stock);
            node.closest("tr").prev().find(".skuID").val(res.skuID);
            node.closest("tr").prev().find(".qt").attr("max", res.stock);
            // 取得目前數量
            let curNum = node.closest("tr").prev().find(".qt").val();
            console.log("curNum =>" + curNum)
            console.log()
            node.closest("tr").prev().find(".tt").text(res.skuPrice * curNum);
            let tp = node.closest("tr").prev().find(".skuID").val();
            console.log("skuId =>" + tp)

        })





    })
    // 刪除
    $(document).on("click", ".icon_close", function () {

        swal({
            title: " 確定要刪除嗎 ?",
            icon: "warning",
            buttons: true,
            dangerMode: true
        }).then((value) => {

            if (value == true) {
                $(this).closest("tr").next("tr").remove();
                $(this).closest("tr").remove();
                let skuID = $(this).closest("tr").find(".skuID").val();
                console.log(skuID);

                let data = {
                    action: "deleteCart",
                    cartItem: {
                        num: null,
                        skuPrice: null,
                        skuID: skuID,
                        spuID: null,
                        allAttr: null,
                        descript: null
                    }
                }

                fetch("http://localhost:8081/Adopets/shCartAction", {
                    method: 'POST',
                    body: JSON.stringify(data)
                }).then(function (response) {
                    return response.json();
                }).then(function (res) {
                    console.log("delete!");
                })


            }

        })
    })
    // 數量調整
    $(document).on("click", ".pro-qty", function () {
       
        let skuID = $(this).closest("tr").find(".skuID").val();
        let num=$(this).closest("tr").find(".qt").val();

        let data = {
            action: "updateNum",
            cartItem: {
                num: num,
                skuPrice: null,
                skuID: skuID,
                spuID: null,
                allAttr: null,
                descript: null
            }
        }



        fetch("http://localhost:8081/Adopets/shCartAction", {
            method: 'POST',
            body: JSON.stringify(data)
        }).then(function (response) {
            return response.json();
        }).then(function (res) {
            console.log("update!");
        })





    })






})