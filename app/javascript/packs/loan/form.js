$( document ).on('turbolinks:load', function() {
  $('#amount').on('keyup',function() {
    loan_calculation($(this).val(),$('#monthly_rate').val(),$('#installments').val())
    var value = parseFloat($(this).val())
    if (value){
      $('#amount-prev').text(`${value.toFixed(3)}`)
    }else{
      $(this).val('')
      $('#amount-prev').text('00')
    }
    enable_next_step()
  })
  $('#installments').on('change',function() {
    loan_calculation($('#amount').val(),$('#monthly_rate').val(),$(this).val())
    $('#installments-prev').text($(this).val())
  })
  
  $('#installments').trigger('change')

  $('#next-step').on('click',function(e){
    amount = parseFloat($('#amount').val())
    installments = $('#installments').val()
    link = $(this).prop('href') + `?amount=${amount}&installments=${installments}`
    $(this).prop('href',link)
  })
})

function loan_calculation(amount,monthly_rate,installments){
  mr = parseFloat(monthly_rate)/100
  prev = ((1.0 + mr) ** installments)
  result = amount * (( prev * mr)/( prev - 1))
  if(result){
    $('#installments-monthly-prev').text(result.toFixed(3))
  }
}

function enable_next_step(){
  if(parseFloat($('#amount').val()) > 0 ){
    $("#next-step").removeClass('disabled')
  }else{
    $("#next-step").addClass('disabled')
  }
}