$(function(){ 
  $('#value').on('keyup',function() {
    loan_calculation($(this).val(),$('#monthly_rate').val(),$('#installments').val())
  })
  $('#installments').on('change',function() {
    loan_calculation($('#value').val(),$('#monthly_rate').val(),$(this).val())
  })
})

function loan_calculation(value,monthly_rate,installments){
  prev = ((1.0 + parseFloat(monthly_rate)) ** installments)
  result = value * (( prev * monthly_rate)/( prev - 1))
  console.log(result)
}