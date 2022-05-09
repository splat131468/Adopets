const twzipcode = new TWzipcode(".twzipcode");

$(document).ready(function(){
    let x = 0
    x = "迴圈的次數";
    $(".donateCount").text(x);
});
$(document).ready(function(){
    let x = 0;
    // x = 迴圈的次數;
    $(".adoptCount").text(x);
});
var preview_img = function(file){
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.addEventListener("load",function(){
        let img_str = '<img src= "'+reader.result+'" class="preview_img">';
        document.getElementById("preview").innerHTML = img_str;
    });
};
document.getElementById("p_file").addEventListener("change",function(e){
    if(this.files.length>0){
        preview_img(this.files[0]);
    }else{
        document.getElementById("preview").innerHTML ='<img src="../image/user.png" alt="">';
    }
});