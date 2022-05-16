
$(function(){
    
var mycanvas = document.getElementById('mycanvas');
var cxt = mycanvas.getContext('2d');//canvas getContext 渲染環境
var validate = "";
var baseColor = ["#0000ff", "#CE0000", "#7E3D76", "#46A3FF"];//底色
var sColor = ["#B22222", "#F9F900", "#82D900", "#FFAF60"];   //干擾點顏色
var fColor = ["#FFA07A", "#00BB00", "#EAC100", "#F75000"];   //文字顏色
var indexColor = ""; //顏色組序號

/*生成隨機顏色組合序號*/
function randColor() {
    indexColor = "";
    indexColor = Math.floor(Math.random() * baseColor.length); //亂數取得 0~顏色陣列長度
    return indexColor;
}

/*生成6位隨機數*/
function rand() {
    validate = "";
    // 大小寫英文 數字 排除 I l o O 0  ,並重複數字 增加出現機率
    var str = "123456789abcdefghijkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ123456789";
    var arr = str.split("");
    var ranNum;
    for (var i = 0; i < 6; i++) {
        ranNum = Math.floor(Math.random() * 66);   //隨機數在[0,65]之間
        validate += arr[ranNum];
    }
    //alert("rand() "+validate);
    //alert("rand() "+typeof(validate));
    return validate;
}

/*干擾線的隨機x坐標值*/
function lineX() {
    var ranLineX = Math.floor(Math.random() * 150);
    return ranLineX;
}

/*干擾線的隨機y坐標值*/
function lineY() {
    var ranLineY = Math.floor(Math.random() * 40);
    return ranLineY;
}

/*更換內容*/
function clickChange() {
    var i = randColor(); //執行randColor()取得顏色組序號
    //alert(i);
    cxt.beginPath();
    cxt.fillStyle = baseColor[i];//底色
    cxt.fillRect(0, 0, 150, 40);//(x,y,width,height)

    /*生成干擾點 40*/
    for (var j = 0; j < 40; j++) {

        //產生一個新路徑，產生後再使用繪圖指令來設定路徑 
        //若省略beginPath，則每點擊一次驗證碼會累積干擾線的條數
        cxt.beginPath();
        cxt.fillStyle = sColor[i];//顏色
        var arcSize = (Math.floor(Math.random() * (50 - 5 + 1)) + 5) / 10; //亂數 取得介於0.5~5之間的值
        cxt.arc(lineX(), lineY(), arcSize, 0, 2 * Math.PI);  //arc()產生一個圓形  context.arc(x,y,r,sAngle,eAngle,counterclockwise);
        cxt.fill();

    }
    cxt.fillStyle = fColor[i];//隨機文字顏色
    cxt.font = 'bold 25px Verdana';
    cxt.fillText(rand(), 10, 30);   //把rand()生成的隨機數文本填充到canvas中      
}

/*點擊驗證碼更換*/
mycanvas.onclick = function (e) {
    e.preventDefault();   //阻止滑鼠點擊發生預設的行為
    clickChange();
}

$( "#donatebtn" ).click(function() {
	/*輸入驗證碼與核對*/
	

	var vad = $("#myvad").val();
    //alert("myform "+vad.toUpperCase());
    //alert("myform "+validate.toUpperCase());
    //將字串利用toUpperCase()將小寫英文轉成大寫英文 進行比較
    if (vad.toUpperCase() === validate.toUpperCase()) {
    	
       
          
                
        $("#myvad").val("");
        clickChange();
        
     	onEditButtonClick();
        // location.href = "./donate.html";  //把網頁導向另一個html頁面-----------------------------------
    }
    else {
        Swal.fire(
            '請輸入正確驗證碼!',
            'You have wrong format!',
            'error'
          )
        $("#myvad").val("");
    }
    
	 
});

/*輸入文字框清空*/ //改用placeholder設定預設內容
/*var myvad=document.getElementById('myvad');
myvad.addEventListener("focus",function(e){
    myform.vad.value="";
});*/

clickChange();
});
