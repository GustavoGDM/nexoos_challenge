$(function(){ 
  $('#value').on('change keyup',function() {
    loan_calculation($(this).val(),$('#monthly_rate').val(),$('#installments').val())
    if (parseFloat($(this).val())){
      $('#value-prev').text(parseFloat($(this).val()))
    }else{
      $(this).val('')
      $('#value-prev').text('00')
    }
    enable_next_step()
  })
  $('#installments').on('change',function() {
    loan_calculation($('#value').val(),$('#monthly_rate').val(),$(this).val())
    $('#installments-prev').text($(this).val())
  })
  $('#confirm').on('change',function(){
    enable_next_step()
  });
})

function loan_calculation(value,monthly_rate,installments){
  mr = parseFloat(monthly_rate)/100
  prev = ((1.0 + mr) ** installments)
  result = value * (( prev * mr)/( prev - 1))
  if(result){
    $('#installments-monthly').text(result.toFixed(3))
  }
}

function enable_next_step(){
  console.log('chamei a função')
  if($( "#confirm" ).prop('checked') && parseFloat($('#value').val()) > 0 ){
    $(".loan-form form input[type='submit']").prop('disabled',false)
  }else{
    $(".loan-form form input[type='submit']").prop('disabled',true)
  }
}