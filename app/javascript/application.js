// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// document.getElementById('clickableElement').addEventListener('click', function() {
//   let bubble = document.getElementById('bubble');
//   bubble.style.display = 'block';

//   console.log(bubble.style.display)

//   // Position the bubble next to the clickable element
//   var clickableElementRect = this.getBoundingClientRect();
//   bubble.style.top = clickableElementRect.bottom + 'px';
//   bubble.style.left = clickableElementRect.left + 'px';
// });

// Close the bubble when clicking outside of it
document.addEventListener('click', function (event) {
  // if (event.target !== bubble && !bubble.contains(event.target)) {
  //   bubble.style.display = 'none';
  // }

  // let bubbles_group = document.getElementsByClassName("bubble")
  // for (const item of bubbles_group){
  //   item.style.display = "none"
  // }

  // if (!event.target.classList.contains("bubble") && !event.target.classList.contains("word")) {
  //   let bubbles = document.getElementsByClassName("bubble")
  //   for (const item of bubbles){
  //     item.style.display = "none"
  //   }
  //   // bubble.style.display = 'none';
  // }

  let sentence_bubble_id = ""
  let word_bubble_id = ""

  if (event.target.classList.contains("clickableElement") && event.target.classList.contains("sentence")) {
    sentence_bubble_id = 'sentence-' + event.target.getAttribute('id')
    let sentence_bubble = document.getElementById(sentence_bubble_id);
    if (sentence_bubble.style.display == 'none')
      sentence_bubble.style.display = 'block'
    else
      sentence_bubble.style.display = 'none'
  }

  if (event.target.classList.contains("clickableElement") && event.target.classList.contains("word")) {

    word_bubble_id = event.target.parentNode.id + "-" + 'word-' + event.target.getAttribute('id')
    let word_bubble_group = document.getElementsByClassName("word_bubble")
    for (const item of word_bubble_group) {
      if (item.id != word_bubble_id)
        item.style.display = 'none'
    }
    console.log(word_bubble_id)
    let word_bubble = document.getElementById(word_bubble_id);
    if (word_bubble.style.display == 'none')
      word_bubble.style.display = 'block'
    else
      word_bubble.style.display = 'none'
  }
});
