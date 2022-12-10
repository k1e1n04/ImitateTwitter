//切り替えボタン要素を指定
// const blue = document.getElementById('blue');
// const red = document.getElementById('red');
// //ターゲット要素を指定
// const target = document.getElementById('show-tweet');

// //blueボタンが押された時
// blue.addEventListener('onchange', function() {
  
//   target.style.background = '#FF1744';
  
// }, false);

// //redボタンが押された時
// red.addEventListener('onchange', function() {
  
//   target.style.background = '#0091EA';
  
// }, false);
window.addEventListener('DOMContentLoaded', function(){
  var select_color = document.querySelector("select[name=color]");
  const target = document.getElementById('show-tweet');

  select_color.addEventListener('change',function(){
    target.style.background = select_color.value;
  });
});
