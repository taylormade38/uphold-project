const initEmoji = () => {
  const reportForm = document.getElementById("new_report")
  if (reportForm) {
    const positive = document.getElementById("positive")
    const neutral = document.getElementById("neutral")
    const negative = document.getElementById("negative")
    const positiveCheckbox = document.getElementById("report_evaluation_positive")
    const neutralCheckbox = document.getElementById("report_evaluation_neutral")
    const negativeCheckbox = document.getElementById("report_evaluation_negative")
    positive.addEventListener("click", () => {
      positiveCheckbox.checked = true
      positive.classList.add("selected-emoji")
      neutral.classList.remove("selected-emoji")
      negative.classList.remove("selected-emoji")
    })
    neutral.addEventListener("click", () => {
      neutralCheckbox.checked = true
      neutral.classList.add("selected-emoji")
      positive.classList.remove("selected-emoji")
      negative.classList.remove("selected-emoji")
    })
    negative.addEventListener("click", () => {
      negativeCheckbox.checked = true
      negative.classList.add("selected-emoji")
      positive.classList.remove("selected-emoji")
      neutral.classList.remove("selected-emoji")
    })
  }
}

export { initEmoji }
