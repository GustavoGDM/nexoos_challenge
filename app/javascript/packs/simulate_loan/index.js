$( document ).on('turbolinks:load', function( ) {
  $('#applicants').on('change',function(){
    $('#number-of-applicants-prev').text($(this).val())
    installment_per_applicant()
  })
  $("#installments, #applicants").on('change',function(){
    installment_per_applicant()
  })
  $("#installments, #applicants").trigger('change')

  $('#amount').on('keyup',function(){
    installment_per_applicant()
  })
  $('#amount').trigger('click')
})

function installment_per_applicant(){
  result = $('#amount').val()/$('#installments').val()
  $('#installments-per-applicants-prev').text(result.toFixed(3)) 
}