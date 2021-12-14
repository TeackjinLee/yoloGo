$(document).ready(function(){
  const form = document.querySelector("#form__wrap");
  const checkAll = document.querySelector(".terms__check__all input");
  const checkBoxes = document.querySelectorAll(".input__check input");
  const submitButton = document.querySelector(".pay_result .next-button");
  
  const agreements = {
    goodsRefundAgree: false,
    privacyPolicy: false,
    serviceAgree: false,
    ageAgree: false
  };
  
  form.addEventListener("submit", (e) => e.preventDefault());

checkBoxes.forEach((item) => item.addEventListener("input", toggleCheckbox));

function toggleCheckbox(e) {
  const { checked, id } = e.target;
  agreements[id] = checked;
  this.parentNode.classList.toggle("active");
  checkAllStatus();
  toggleSubmitButton();
}

function checkAllStatus() {
  const { goodsRefundAgree, privacyPolicy, serviceAgree, ageAgree } = agreements;
  if (goodsRefundAgree && privacyPolicy && serviceAgree && ageAgree) {
    checkAll.checked = true;
  } else {
    checkAll.checked = false;
  }
}

function toggleSubmitButton() {
  const { goodsRefundAgree, privacyPolicy, serviceAgree, ageAgree } = agreements;
  if (goodsRefundAgree && privacyPolicy && serviceAgree && ageAgree) {
    submitButton.disabled = false;
  } else {
    submitButton.disabled = true;
  }
}

checkAll.addEventListener("click", (e) => {
  const { checked } = e.target;
  if (checked) {
    checkBoxes.forEach((item) => {
      item.checked = true;
      agreements[item.id] = true;
      item.parentNode.classList.add("active");
    });
  } else {
    checkBoxes.forEach((item) => {
      item.checked = false;
      agreements[item.id] = false;
      item.parentNode.classList.remove("active");
    });
  }
  toggleSubmitButton();
});
  
});