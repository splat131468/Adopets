
$(function () {

  // 驗證函數 (正數)
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





  /// 換iframe函數
  function chgIframe() {
    //路徑
    $("#insert").replaceWith('<iframe id="addProductPage" src="./addItem.jsp" frameborder="0" scrolling="yes" name="ifm" width="100%" height="700px" ></iframe>');

    return true;
  }
  /////////

  //////去子頁面抓元素 並做畫面嵌入 (注意路徑)
  function ctgPage(chk) {
    const url = '/Adopets/ProductAction';

    if (chk) {
      let optionsNode = $('#addProductPage').contents().find('#allcateOptions');
      console.log(optionsNode)
      fetch(url, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({
          action: 'getCatgName'
        })
      }).then(resp => resp.json())
        .then(allCategory => {
          allOption = "";

          allCategory.forEach(element => {
            // 循環加入
            allOption += '<div class="card-block text-center radio ">' +
              '<p class="sub-desc">' + element.ctgName + '</p>' +
              '</div>';
          });
          console.log($('#allcateOptions'));
          optionsNode.append(allOption);
          console.log(allOption)

        });

    }
  }
  ////////////

  /////////// 點擊開啟子頁面
  $("#additem").on("click", function () {
    // 路徑記得改
    let rs = chgIframe();
  })
  ////////////

  ////////////刷新頁面取得所有商品 (注意路徑)

  // 開啟 視窗
  $("button.btn_modal").on("click", function () {
    $("div.overlay").fadeIn();
  });

  // 關閉 彈窗
  $("button.btn_modal_close").on("click", function () {
    let ck = confirm("確定要放棄次編輯嗎？");
    if (ck === true) {
      $("div.overlay").fadeOut();
    } else {
      return;
    }
  });



  // 資料回填編輯表
  $(document).on("click", "#rs", function () {
    let price = $(this).closest("tr").find(".price").text();
    let name = $(this).closest("tr").find(".name").text();
    let stock = $(this).closest("tr").find(".stock").text();
    let status = $(this).closest("tr").find(".status").val();
    let attr = $(this).closest("tr").find(".attr").text();
    let skuID = $(this).closest("tr").find(".skuID").val();
    $("#itemName").text(name);
    $("#itemAttr").text(attr);
    $("#itemPrice").val(price);
    $("#itemStock").val(stock);
    $("#itemID").val(skuID);
    // 跑循環 如果status == 選項值 則checked
    $("input[name='status']").each(function (index, item) {
      if ($(item).val() == status) {
        $(item).attr("checked", true);
      }
    })

  })

  // 根據商品名稱 收尋商品(路徑)
  $("#searchByName").on("click", function () {
   
    let project = "Adopets";
    let url = `/${project}/prodManage`;
    let prodName = $("#srh").val();
    $.ajax({
      url: url,
      type: 'POST',
      data: JSON.stringify({
        "action": "searchByName",
        "spuName": prodName
      }),
      success: function () {
        $("body").load("/Adopets/views/ecommerce/goods.jsp", "#tb")

      },
    });
})

// 送出編輯商品請求 路徑
$("#updateProd").on("click", function () {
  // 抓資料

  let skuPrice = $("#itemPrice").val();
  let stock = $("#itemStock").val();
  let skuID = $("#itemID").val();
  let status = $("input[name='status']:checked").val();

  if (chktable(skuPrice) && chktable(stock)) {

    $.ajax({
      url: "/Adopets/prodManage",
      data: JSON.stringify({
        "skuID": skuID,
        "stock": stock,
        "skuPrice": skuPrice,
        "status": status,
        "action": "updateProd"
      }),
      type: "POST",
      success: function () {
        // 修改完資料依舊停留在同個頁面
        $(`#${skuID}`).closest("tr").find(".price").text(skuPrice);
        $(`#${skuID}`).closest("tr").find(".stock").text(stock);
        $(`#${skuID}`).closest("tr").find(".status").text(status);
        // console.log(status);
        $("body").load("/Adopets/views/ecommerce/goods.jsp", "#tb");
        $("div.overlay").fadeOut();
      },
      error:function(){
        alert("修改失敗")
      }
    })
  } else {
    alert("只能為正整數！！")
  }
})













})
