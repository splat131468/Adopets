
// 全局參數////////////////////////////

// 新增table 欄位
var editing = 0; // 控制一次只能編輯一個 只跟新增屬性時有關
// ajax 預設總量
var editRow = 0; // 控制編輯屬性數量 會影響到屬性總量




// 拿來驗證是否為數字 整數 開頭不得為0
function chktable(item) {

    // 驗證input 內只能有數字
    let no0 = new RegExp(/^[0]+/, '');
    let nom = new RegExp("^([0-9]*[.0-9])$");


    if (no0.test(item)) {
        return false;
    }

    if (!nom.test(item)) {

        return false;
    }
    if ((!isNaN(item)) && item.length > 0) {
        return true;
    } else {
        return false;
    }
};



///////////////////////////////////////////


//轉base64方法
function base64(file) {

    let reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function () {
        // thread 讀完之後!
        return reader.result;
    };
}




////////////////////////////////////////////

// 驗證 價格 庫存function()


function valPcSk() {
    // 檢查所有新增的庫存量必須為數字！
    $('.lnum').each(function () {
        let item = $(this).val();
        if (!chktable(item)) {
            return false;
        }
    });


    // 檢查所有新增的產品價格必須為數字！
    $('.lprice').each(function () {

        let item = $(this).val();
        if (!chktable(item)) {
            return false;
        }
    });


    // 確認lprice 需要為0
    if ($('.lprice').val().length == 0 || $('.lnum').val().length == 0) {
        return false;
    }
    return true;
}


//////////////////////////////////////////////








///////////////////////////////////////////////

// 驗證第一頁
function validate1(val) {

    // f2 用來判斷多少格已選 
    var tk = $(".f2").length;


    if (val === 1) {
        v1 = document.getElementById("pname");
    }

    if (val === 2) {
        v2 = document.getElementById("itemdesc");
    }

    v3 = document.getElementById("itemp1");
    v4 = document.getElementById("itempall");



    flag1 = true;
    flag2 = true;
    flag3 = true; // 被拿來驗證 新增規格
    flag4 = true;

    if (tk >= 1) {
        if (val >= 1 || val == 0) {


            if (v1.value == "") {
                v1.style.borderColor = "red";

                flag1 = false;

            }
            else {

                v1.style.borderColor = "green";

                flag1 = true;
            }
        }
    }

    if (tk >= 2) {
        if (val >= 2 || val == 0) {
            // if (tk + 1 != 2||tk!=2) {
            if (v2.value == "") {
                v2.style.borderColor = "red";
                flag2 = false;
            }
            // }
            else {
                // if (tk + 1 != 2) {
                v2.style.borderColor = "green";
                // }
                flag2 = true;
            }
        }
    }

    if (val >= 3 || val == 0) {
        if (v3.value == "") {
            v3.style.borderColor = "red";
            flag3 = false;
        }
        else {
            v3.style.borderColor = "green";
            flag3 = true;
        }
    }

    if (val >= 4 || val == 0) {
        let limit3 = document.querySelector(".picsub").files.length;
        if (v4.value == "" || limit3 != 3) {
            v4.style.borderColor = "red";
            flag4 = false;


        }
        else {
            v4.style.borderColor = "green";
            flag4 = true;
        }
    }

    // 若勾選新增 第二頁到第三頁需判斷 至少一個規格  
    // 目前用不到！


    // var hadEdit = $(".tagAdd").hasClass("selected");
    // console.log("是否要編輯 ？" + hadEdit);
    // if (hadEdit === false) {
    //     flag3 = true;
    // }

    // if (hadEdit === true) {

    //     let len = $('.attrlist').length;
    //     console.log(len);
    //     if (len >= 1) {
    //         console.log('flag3=' + flag3);
    //         flag3 = true;
    //     }
    // }
    flag = flag1 && flag2 && flag3 && flag4;
    return flag;
}


// 第二頁驗證  驗證新增的庫存以及價格需要為數字，且不得為0
function validate2(val) {


    let flag6 = true;

    flag6 = valPcSk();


    if (flag6 == false) {
        alert('格式有誤');
    }

    flag = flag6;

    return flag;
}



$(function () {


    // 建立對應的屬性值
    $('.attrlist').on('click', function () {

        let product_Category = $(".selected").find('.sub-desc').html();

        $.ajax({
            url: "http://localhost:8081/Adopets/ProductAction",
            data: JSON.stringify({
                "ctgName": product_Category,
                "action": "getAttrList"
            }),
            type: "post",
            dataType: 'json',
            success: function (data) {
                // editRow 會隨著attr 變動
                editRow = data.length;
                for (let i = 0; i < data.length; i++) {




                    $('#attrField').prepend(`
<form class="p1remove" style=" margin:20px auto ;padding: 10px 10px">
      
       <i id="trash" class="fa fa-trash-o" aria-hidden="true"></i><br>
       <h6 id="specName" name="collectName" style="display:inline;"  value="${data[i].attrName}" > ${data[i].attrName} : </h6>
       <input type="checkbox" name="collect" style="margin:10px 10px"  value="${data[i].valueList[0]}" > ${data[i].valueList[0]}
       <input type="checkbox" name="collect" style="margin:10px 10px"  value="${data[i].valueList[1]}" > ${data[i].valueList[1]}
       <input type="checkbox" name="collect" style="margin:10px 10px"  value="${data[i].valueList[2]}"> ${data[i].valueList[2]} 
       <input type="checkbox" name="collect" style="margin:10px 10px; display:none;" checked="checked" value="split"> 
   </form>`);


                }


                // editrow
                // append
            }
        })

    })



    // 驗證 產品類別 選擇才能往第二頁走
    $(document).on('click', '.radio', function () {
        $(".radio").removeClass("selected");
        $(this).addClass('selected');
        $("#next1").css("display", "inline");

    });

    // 回後台
    $('.cancel').on("click", function () {
        if (confirm("你確定要放棄本次編輯？")) {
            //  路徑 要改
            window.top.location = "http://localhost:8081/Adopets/views/ecommerce/goods.jsp";
            $("body").load("http://localhost:8081/Adopets/views/ecommerce/goods.jsp", "#tb");
        }
    })

    // 前一頁清除 資料  p1 是第一個 前一頁按鈕  f2是第二張表單
    $('.p1').on("click", function () {
        if (confirm("將取消您已編輯的資訊")) {
            $('.p2val').each(function (index) {
                // $('table tbody').html('');
                //$(this).val("");
            });
            // $('.newSpec').css('display', 'none');
            $('#category').remove();
            var mul = $('.f2').val();

            $('.f2').each(function (index) {
                $(this).css("borderColor", "");
                $(this).val("");

            });
            // 去除照片
            $('img').each(function () {
                $(this).removeAttr("src");
            })
            // 清除第三頁屬性                    
            $('.p1remove').each(function () {
                editing--;
                editRow--;
                $(this).remove();
            })
            //  itemList addtg 也要清除
            $('#itemList').remove();
            $('#addtg').remove();

        }

    })



    $('[data-toggle="tooltip"]').tooltip();
    var actions = $("table td:last-child").html();

    $(".add-new").click(function () {

        if (editing == 1) {
            alert("請先儲存定義好的屬性");
        } else {
            editing++;

            if (editRow == 2) {

            } else {

                $(this).attr("disabled", "disabled");
                let index = $("table tbody tr:last-child").index();
                let row = '<tr class="attrlist">' +
                    '<td ><input id="aname" type="text" class="form-control p2val p2val1" name="a" style="padding:0px 0px"  ></td>' +
                    '<td ><input id="av1"  type="text" class="form-control p2val p2val2" name="b" style="padding:0px 0px"  ></td>' +
                    '<td ><input id="av2" type="text" class="form-control p2val p2val3" name="c" style="padding:0px 0px" ></td>' +
                    '<td ><input id="av3"  type="text" class="form-control p2val p2val4" name="d" style="padding:0px 0px"  ></td>' +
                    '<td >' + actions + '</td>' +
                    '</tr>';
                $("table").append(row);
                $("table tbody tr").eq(index + 1).find(".add, .edit").toggle();
                $('[data-toggle="tooltip"]').tooltip();
                $("#saveAttr").addClass('-hide');
            }
        }
    });
    // 加入新的row
    $(document).on("click", ".add", function () {
        var empty = false;
        var input = $(this).parents("tr").find('input[type="text"]');
        input.each(function () {
            // 有無資料填入
            if ((!$(this).val()) || $(this).val().trim().length == 0) {
                $(this).addClass("error");
                empty = true;
            } else {
                $(this).removeClass("error");
            }
        });

        $(this).parents("tr").find(".error").first().focus();
        if (!empty) {
            input.each(function () {
                // 編輯時 新增按鈕會disabled
                $(this).parent("td").html($(this).val());
            });
            $(this).parents("tr").find(".add, .edit").toggle();
            $(".add-new").removeAttr("disabled");
            $("#saveAttr").removeClass('-hide');



        }
    });
    // 編輯
    $(document).on("click", ".edit", function () {
        $(this).parents("tr").find("td:not(:last-child)").each(function () {
            $(this).html('<input type="text" class="form-control" value="' + $(this).text() + '">');
        });
        $(this).parents("tr").find(".add, .edit").toggle();
        $(".add-new").attr("disabled", "disabled");



    });
    // 刪除row
    $(document).on("click", ".delete", function () {
        $(this).parents("tr").remove();

        $("div[role='tooltip']").remove();

        $(".add-new").removeAttr("disabled");
        $("#saveAttr").removeClass('-hide');
        editing--;
        editRow--;

    });



    var arra;
    var arrb;
    var arrc;
    var arrd;
    var attrlength = 0; // 規定只能有兩個屬性
    // 測試
    $(document).on('change', '.p2val1', function () {

        arra = $(this).val();
        arra = arra.trim();

    });

    $(document).on('change', '.p2val2', function () {

        arrb = $(this).val();
        arrb = arrb.trim();
    });

    $(document).on('change', '.p2val3', function () {

        arrc = $(this).val();
        arrc = arrc.trim();
    });
    $(document).on('change', '.p2val4', function () {

        arrd = $(this).val();
        arrd = arrd.trim();
    });


    $(document).on('click', '#saveAttr', function () {

        if (editRow == 3) {
            alert("最多只能有兩個屬性")
        } else {
            if (arra.length == 0 || arrb.length == 0 || arrc.length == 0 || arrd.length == 0) {
                console.log("不能為null")
            } else {
                $('#attrField').prepend(`
                    <form class="p1remove" style=" margin:20px auto ;padding: 10px 10px">
                          
                           <i id="trash" class="fa fa-trash-o" aria-hidden="true"></i><br>
                           <h6 id="specName" name="collectName" style="display:inline;"  value="${arrb}" > ${arra} : </h6>
                           <input type="checkbox" name="collect" style="margin:10px 10px"  value="${arrb}" > ${arrb}
                           <input type="checkbox" name="collect" style="margin:10px 10px"  value="${arrc}" > ${arrc}
                           <input type="checkbox" name="collect" style="margin:10px 10px"  value="${arrd}"> ${arrd} 
                           <input type="checkbox" name="collect" style="margin:10px 10px; display:none;" checked="checked" value="split"> 
                       </form>`);
                $('table tbody').html('');
                editing--;
                editRow++;
                attrlength += 1;
                arra = null;
                arrb = null;
                arrc = null;
                arrd = null;
                // 5/3 修正
                $("article").toggleClass("-hide");
               
            }

        }

    });


    // 畫面處理的部分 問老師！！

    var current_fs, next_fs, previous_fs;

    $(".next").click(function () {

        str1 = "next1";
        str2 = "next2";
        str3 = "next3";

        if (!str2.localeCompare($(this).attr('id')) && validate1(0) == true) {
            val2 = true;

        }
        else {
            val2 = false;
        }

        if (!str3.localeCompare($(this).attr('id')) && validate2(0) == true) {
            val3 = true;
        }
        else {

            val3 = false;
        }

        if (!str1.localeCompare($(this).attr('id')) || (!str2.localeCompare($(this).attr('id')) && val2 == true) || (!str3.localeCompare($(this).attr('id')) && val3 == true)) {
            current_fs = $(this).parent().parent();
            next_fs = $(this).parent().parent().next();

            $(current_fs).removeClass("show");
            $(next_fs).addClass("show");

            $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

            current_fs.animate({}, {
                step: function () {

                    current_fs.css({
                        'display': 'none',
                        'position': 'relative'
                    });

                    next_fs.css({
                        'display': 'block'
                    });
                }
            });
        }


    });

    $(".prev").click(function () {

        current_fs = $(this).parent().parent();
        previous_fs = $(this).parent().parent().prev();

        $(current_fs).removeClass("show");
        $(previous_fs).addClass("show");

        $("#progressbar li").eq($("fieldset").index(next_fs)).removeClass("active");

        current_fs.animate({}, {
            step: function () {

                current_fs.css({
                    'display': 'none',
                    'position': 'relative'
                });

                previous_fs.css({
                    'display': 'block'
                });
            }
        });
    });

    // 新增屬性
    //  清除屬性row 並做新增
    $("#addattr2").on("click", function () {
        $('#itemList').remove();
        $('#loc').find('#addtg').remove();
        $("article").toggleClass("-hide");
    })
    //  屬性移除
    $(document).on("click", "#trash", function () {
        editing--;
        editRow--;
        alert("你確定要移除該屬性？");
        $(this).closest("form").remove();
    })







    // 點擊完成 建立table  不知道為什麼一直綁不到checked...
    $(document).on("change", "input[name='collect']", function () {

        // 先刪除過去已建立的table
        $('#itemList').remove();
        $('#loc').find('#addtg').remove();

        //  物件
        let objattr = {
            name: [],
            attr1: [],
            attr2: [],
        };

        let pv = true;
        // 取值

        $('[name="collectName"]').each(function () {
            objattr.name.push($(this).html());
        });

        $('[name="collect"]:checked').each(function (index) {

            if (pv == true) {
                if ($(this).val() == 'split') {
                    pv = false;
                } else {
                    objattr.attr1.push($(this).val());
                }
            } else {
                if ($(this).val() == 'split') {
                    pv = false;
                } else {
                    objattr.attr2.push($(this).val());
                }
            }
        });

        // console.log(objattr);


        // 做組合  暫定做兩個屬性
        let nameLen = objattr.name.length;
        let at1 = objattr.attr1.length;
        let at2 = objattr.attr2.length;
        let allAttr = [];
        let result = []; // 結果


        // 如果沒做勾選則返回
        if (nameLen == 0 || at1 + at2 == 0) {
            alert("沒有選擇商品屬性！！！");
            return;
        }


        // 字串相接  屬性名：屬性值
        for (let i = 0; i < nameLen; i++) {
            if (objattr.name[i].length != 0) {
                let lim;
                let isrt;
                if (i == 0) {
                    lim = at1;
                    isrt = objattr.attr1;
                } else {
                    lim = at2;
                    isrt = objattr.attr2;
                }
                for (let a = 0; a < lim; a++) {
                    let temp = objattr.name[i]; // 屬性名稱
                    temp += isrt[a]; // 屬性值
                    allAttr.push(temp);
                }
            }
        }
        // console.log(allAttr);
        // console.log(nameLen);
        let istAttrC = "";

        if (nameLen == 1) {

            for (let j = 0; j < at1; j++) {
                result.push(allAttr[j]);
            }

        }
        if (nameLen == 2) {
            for (let k = 0; k < at1; k++) {
                for (let j = 0; j < at2; j++) {
                    result.push(allAttr[k] + " , " + allAttr[j + at1]);
                }
            }
            // console.log(result);

        }

        $.each(result, function (i, item) {
            istAttrC += `<tr>
                                    <th style="width:25px" scope="row">${i + 1}</th>
                                    <td style="padding:12px 0px"><span style="width:70px;padding:0px 0px; font-size:14px ;"  class="itemSKU" >${item}</span></td>
                                    <td style="padding:2px 2px"><input type="text" class="lnum" style="width:70px;padding:1px 2px ;margin:10px 5px"></td>
                                    <td style="padding:2px 2px"><input type="text"  class="lprice" style="width:70px;padding:1px 2px ; margin:10px 5px"></td>
                                </tr>`;
        });



        // 插入表格
        $('#attrField').after(`
      
        <table id="itemList" class="table" style="margin-bottom:30px">
                            <thead>
                                <tr>
                                    <th style="width:25px" scope="col">#</th>
                                    <th scope="col">規格</th>
                                    <th scope="col">數量</th>
                                    <th scope="col">價格</th>
                                </tr>
                            </thead>
                            <tbody id="here">
                                <tr style="display:none">
                                    <th scope="row">1</th>
                                    <td></td>
                                    <td><input type="text" style="width:70px;padding:1px 2px "></td>
                                    <td><input type="text" style="width:70px;padding:1px 2px"></td>
                                </tr>
                                `+ istAttrC + `
                            </tbody>
                        </table>
                       <div id="addtg">
                        <h6>統一定價</h6>
        <a style="display:inline;margin:5px 5px; border-radius:5px"> 數量 :<input class="tnum"  type="text" style="width:70px;padding:1px 2px;margin:5px 5px "></a>
        <a  style="display:inline;margin:5px 5px; border-radius:5px"> 價格 :<input class="tprice" type="text" style="width:70px;padding:1px 2px ;margin:5px 5px"></a>
        <a href='#' class="tconfirm" style="display:inline;margin:5px 5px; border-radius:5px">確認</a>
        </div>`
        )
    });

    // 批次處理價格
    $(document).on('click', '.tconfirm', function () {

        let price = $('.tprice').val();
        let num = $('.tnum').val();
        let no0 = new RegExp(/^[0]+/, '');
        let nom = new RegExp("^([0-9]*[.0-9])$");
        if (no0.test(price)) {
            alert("開頭不能為0");
            return;
        }
        if (no0.test(num)) {
            alert("開頭不能為0");
            return;
        }
        if (!nom.test(price)) {
            alert("須為整數");
            return;
        }
        if (!nom.test(num)) {
            alert("須為整數");
            return;
        }


        if ((!isNaN(price)) && price.length > 0) {
            $('.lprice').val(price);
        } else {
            alert("只能有數字");
        }
        if ((!isNaN(num)) && num.length > 0) {

            $('.lnum').val(num);
        } else {
            alert("只能有數字");
        }
    });


    $('.pic').change(function () {

        let file = $('.pic').get(0).files[0];
        //建立用來讀取此檔案的物件
        let reader = new FileReader();
        //使用該物件讀取file檔案
        reader.readAsDataURL(file);
        //讀取檔案成功後執行的方法函式
        reader.onload = function (e) {
            //選擇所要顯示圖片的img，要賦值給img的src就是e中target下result裡面
            //的base64編碼格式的位址
            $('#imgshow').get(0).src = e.target.result;
        }
    });


    // 多個

    $('.picsub').change(function () {
        let colpic = [$('#imgshowsub1'), $('#imgshowsub2'), $('#imgshowsub3')];
        let piclen = $('.picsub').length;
        $('img').each(function (index) {
            // 因為有主照片 所以要避開
            if (index != 0) {
                // 清空照片
                $(this).attr("src", "");
            }
        })
        for (let j = 0; j < 3; j++) {
            let file = $('.picsub').get(0).files[j];
            let reader = new FileReader();
            reader.readAsDataURL(file);

            reader.onload = function (e) {
                colpic[j].get(0).src = e.target.result;
            }
        }
    });

    // 提交
    $('.finalSubmit').on('click', function () {

        console.log(valPcSk())
        // 若為false 則不能提交
        if (!valPcSk()) {
            alert("資料不完全 無法上架商品")
            return;
        }



        // 附屬照片
        let colpic = [$('#imgshowsub1'), $('#imgshowsub2'), $('#imgshowsub3')];

        // 商品類型
        let product_Category = $(".selected").find('.sub-desc').html();
        console.log('product_Category : ' + product_Category);
        //  商品名稱
        let product_name = $('#pname').val();
        console.log(product_name);
        //   商品描述
        let product_desc = $('#itemdesc').val();
        console.log(product_desc);
        // 商品照片 arr[0]  是主照片




        //修改4/18
        // let product_pics=new FormData();
        // let file = $('.pic').get(0).files[0];
        // product_pics.append("mainImg",file);





        // 建立map 裝主要照片 次要照片

        //  let product_pics=new Map();
        let product_pics = {
            mainImg: "",
            subImg: [],
        };




        // 次要照片放arr
        let subImgArr = [];

        // 主照片
        product_pics.mainImg = ($('#imgshow').get(0).src);




        // 次要照片
        for (let j = 0; j < 3; j++) {

            product_pics.subImg.push(colpic[j].get(0).src);
        }


        console.log(product_pics);



        // 商品規格
        let products_SKU = [];
        // 商品庫存
        let products_stock = [];
        // 商品價格
        let products_price = [];
        // sku物件
        let sku_obj = {
            attrN1: "",
            attrV1: "",
            attrN2: "",
            attrV2: "",
        }


        // 將規格由String切割為物件再轉成json
        $('.itemSKU').each(function (index) {

            let strsk = $(this).html();
            // 切割規則
            let rl = /[,:]/;
            let tempArr = strsk.split(rl);
            console.log("切割結果" + tempArr);
            sku_obj.attrN1 = tempArr[0];
            sku_obj.attrV1 = tempArr[1];

            //有兩個規格
            if (tempArr.length == 4) {
                sku_obj.attrN2 = tempArr[2];
                sku_obj.attrV2 = tempArr[3];
            }
            // 把物件裝進arr
            products_SKU.push(JSON.stringify(sku_obj));
        })
        $('.lnum').each(function (index) {
            console.log(index + '個lum' + $(this).val());
            if($(this).val()==""||$(this).val().length==0){
            alert("價格不得為空")
            }
            products_stock.push($(this).val());
        })
        $('.lprice').each(function (index) {
            console.log(index + '個lprice' + $(this).val());
            if($(this).val()==""||$(this).val().length==0){
                alert("商品數量不得為空")
            }
            products_price.push($(this).val());
           
        })

        // 記得改路徑
        let domain = "localhost";
        let port = "8081";
        let project = "Adopets";
        let url = `http://${domain}:${port}/${project}/ProductAction`;

        fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                ctgName: product_Category,
                spuName: product_name,
                descript: product_desc,
                spuImgs: product_pics,
                specAttrs: products_SKU,
                stocks: products_stock,
                skuPrices: products_price,
                action: 'launchProd'
            })
        }).then(resp => json())
            .then(
                // 3秒後跳回首頁 路徑調整
                setTimeout(() => {
                    chkProd();
                }, 2000)
            );
    });
    ////////回選單
    function chkProd() {
        $.ajax({
            type: "GET",
            url: "http://localhost:8081/Adopets/prodManage?action=prodList",
            dataType: "text",
            success: function () {
                window.top.location = "http://localhost:8081/Adopets/views/ecommerce/goods.jsp";
                $("body").load("http://localhost:8081/Adopets/views/ecommerce/goods.jsp", "#tb");
            }
        })
    }
});







