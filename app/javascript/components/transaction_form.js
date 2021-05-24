const radioWithdrawDeposit = document.querySelector('.deposit-withdraw-btn');
const radioTransfer = document.querySelector('.transfer-btn');

const depositForm = document.querySelector('.deposit-form');
const transferForm = document.querySelector('.transfer-form');

radioWithdrawDeposit.addEventListener("click", showTransactionForm(depositForm);
radioWithdrawDeposit.addEventListener("click", showTransactionForm(transferForm));

const showTransactionForm = (form) => {
    form.classList.remove("d-none")
};
