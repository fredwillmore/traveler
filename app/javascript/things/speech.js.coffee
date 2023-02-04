final_transcript = ''
recognizing = false

unless 'webkitSpeechRecognition' in window
  upgrade
else
  start_button.style.display = 'inline-block'
  $.recognition = new webkitSpeechRecognition
#//        recognition.continuous = true;
#//        recognition.interimResults = true;

  $.recognition.onstart = ()->
    recognizing = true
    showInfo 'info_speak_now'
    start_img.src = '<%= image_path "mic-animate.gif" %>'
    $("#start_img").click ()->
      $.recognition.stop

  $.recognition.onerror = (event)->
    if event.error == 'no-speech'
      start_img.src = '<%= image_path "mic.gif" %>'
      showInfo 'info_no_speech'
      self.ignore_onend = true
    if event.error == 'audio-capture'
      start_img.src = '<%= image_path "mic.gif" %>'
      showInfo 'info_no_microphone'
      self.ignore_onend = true
    if event.error == 'not-allowed'
      if event.timeStamp - self.start_timestamp < 100
        showInfo 'info_blocked'
      else
        showInfo 'info_denied'
      self.ignore_onend = true;

  $.recognition.onend = ()->
    recognizing = false
    if self.ignore_onend
      return
    start_img.src = '<%= image_path "mic.gif" %>'
    if !final_transcript
      showInfo 'info_start'
      return;
    showInfo ''
    if window.getSelection
      window.getSelection.removeAllRanges
      range = document.createRange
      range.selectNode document.getElementById('final_span')
      window.getSelection.addRange range

  $.recognition.onresult = (event)->
    interim_transcript = ''
    for i in [event.resultIndex..event.results.length]
      if event.results[i].isFinal
        final_transcript += event.results[i][0].transcript
      else
        interim_transcript += event.results[i][0].transcript

    final_transcript = capitalize final_transcript
    final_span.innerHTML = linebreak final_transcript
    interim_span.innerHTML = linebreak interim_transcript
    if final_transcript || interim_transcript
      showButtons 'inline-block'

  upgrade = ->
    start_button.style.visibility = 'hidden'
    showInfo 'info_upgrade'

  two_line = /\n\n/g
  one_line = /\n/g

  linebreak = (s)->
    return s.replace(two_line, '<p></p>').replace one_line, '<br>'

  first_char = /\S/

  capitalize = (s)->
    return s.replace first_char, (m)->
      return m.toUpperCase

  startButton = (event)->
    if recognizing
      $.recognition.stop
      return

    final_transcript = ''
    $.recognition.lang = '<%=@player.target_locale%>-<%=@player.target_dialect%>'
    $.recognition.start()
    $.recognition.ignore_onend = false
    final_span.innerHTML = ''
    interim_span.innerHTML = ''
    start_img.src = '<%= image_path "mic-slash.gif" %>'
    showInfo 'info_allow'
    showButtons 'none'
    $.recognition.start_timestamp = event.timeStamp

  showInfo = (s)->
    if s
      child = info.firstChild
#      if child.style {
#        child.style.display = child.id == s ? 'inline' : 'none'
#      } while child = child.nextSibling
      info.style.visibility = 'visible'
    else
      info.style.visibility = 'hidden'

  current_style

  showButtons = (style)->
    if style == current_style
      return
    current_style = style
    submit_button.style.display = style
