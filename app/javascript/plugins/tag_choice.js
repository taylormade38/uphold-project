// $(document).ready(function(){
//   $(".tag-choice").click(function(){
//     $(this).toggleClass("active");
//   });
// });

const initTags = () => {
  const tags = document.querySelectorAll(".tag-choice")
  if (tags) {
    tags.forEach((tag) => {
      tag.addEventListener("click", (e) => {
        tag.classList.toggle("active")
      })
    })
  }
}
export { initTags }
