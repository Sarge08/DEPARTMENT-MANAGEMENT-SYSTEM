const inputCheckbox = document.forms.signin.remember;
const inputChecked = document.forms.signin.inputCheckbox;
inputCheckbox.addEventListener("click", handleChangeCheckbox);
function handleChangeCheckbox(e) {
    e.preventDefault();

    if (e.target.value == "") {
        inputCheckbox.innerHTML = '<i class="ph-check"></i>';
        inputChecked.checked = true;
    } else {
        inputCheckbox.innerHTML = "";
        inputChecked.checked = false;
    }
}