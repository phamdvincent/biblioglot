// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('click', function (event) {

  let sentence_bubble_id = ""
  let word_bubble_id = ""

  if (event.target.classList.contains("clickableElement") && event.target.classList.contains("sentence")) {
    sentence_bubble_id = event.target.id + '-' + 'sentence'
    let sentence_bubble_group = document.getElementsByClassName("sentence_bubble")
    for (const item of sentence_bubble_group) {
      if (item.id != sentence_bubble_id)
        item.style.display = 'none'
    }
    let sentence_bubble = document.getElementById(sentence_bubble_id);
    if (sentence_bubble.style.display == 'none')
      sentence_bubble.style.display = 'block'
    else
      sentence_bubble.style.display = 'none'

    let audio_id = "audio-" + event.target.id + "-sentence"
    // console.log(audio_id)
    const audio = document.getElementById(audio_id)

    let startTime;

    audio.addEventListener('timeupdate', function (event) {
      let currentTime = audio.currentTime * 1000 //  performance.now() - startTime

      let word_bubbles = document.getElementsByClassName(sentence_bubble_id + '-word')
      for (const item of word_bubbles) {
        if (currentTime >= parseInt(item.getAttribute("timestamp")))
          item.style.color = "red"
      }
    });

    audio.addEventListener('ended', function (event) {
      let word_bubbles = document.getElementsByClassName(sentence_bubble_id + '-word')
      for (const item of word_bubbles) {
        item.style.color = ""
      }
    });

  }

  if (event.target.classList.contains("clickableElement") && event.target.classList.contains("word")) {

    word_bubble_id = event.target.parentNode.id + "-" + 'word-' + event.target.getAttribute('id')

    let word_bubble_group = document.getElementsByClassName("word_bubble")
    for (const item of word_bubble_group) {
      if (item.id != word_bubble_id)
        item.style.display = 'none'
    }

    let word_bubble = document.getElementById(word_bubble_id);
    if (word_bubble.style.display == 'none')
      word_bubble.style.display = 'block'
    else
      word_bubble.style.display = 'none'
  }

});

function insertAccent(character) {
  var inputField = document.getElementById('story_text');
  var currentPosition = inputField.selectionStart;
  var textBefore = inputField.value.substring(0, currentPosition);
  var textAfter = inputField.value.substring(currentPosition);
  inputField.value = textBefore + character + textAfter;
  inputField.focus();
  inputField.setSelectionRange(currentPosition + 1, currentPosition + 1);
}
