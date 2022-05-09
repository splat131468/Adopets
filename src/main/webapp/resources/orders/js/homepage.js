
// 這是標頭的下拉式選單
$(".menu--main .menu-level-1 > .menu > .menu-item--expanded").hover(
  function() {
      $(this).closest(".menu-item--expanded").addClass("child-is-focused");
  },
  function() {
      $(this)
      .closest(".menu-item--expanded")
      .removeClass("child-is-focused");
  }
  );