function insertAccent(character) {
  var inputField = document.getElementById('story_text');
  var currentPosition = inputField.selectionStart;
  var textBefore = inputField.value.substring(0, currentPosition);
  var textAfter = inputField.value.substring(currentPosition);
  inputField.value = textBefore + character + textAfter;
  inputField.focus();
  inputField.setSelectionRange(currentPosition + 1, currentPosition + 1);
}
