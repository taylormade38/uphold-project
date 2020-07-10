const initSubmitReport = () => {
  const submitButton = document.getElementById("submit-report")
  const modalUserCityInput = document.getElementById("user_city_id")
  const userCityInput = document.getElementById("other_user_city")
  const yesPlease = document.getElementById("yes-please")
  const skipButton = document.getElementById("skip")
  const selectCityOptions = document.getElementById("select-city-options")
  const newReportForm = document.getElementById("new_report")
  if (submitButton){
    submitButton.addEventListener("click", (event) => {
      event.preventDefault();
      console.log("hello")
    })
    skipButton.addEventListener("click", (event) => {
      newReportForm.submit();
    })
    yesPlease.addEventListener("click", (event) => {
      userCityInput.value = selectCityOptions.value
      newReportForm.submit();
    })
  }
}


export { initSubmitReport }
