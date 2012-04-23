$ ->
  $("#registration_coupon").on "blur", (event) ->
    event.preventDefault()
    $form = $(".new_registration")
    $.getJSON "#{$form.attr("action")}/coupon?coupon_code=#{$(this).val()}", (response) =>
      $price = $("#event-price span")
      price = $price.data("original-price")
      newPrice = price - response.amount
      newPrice = 0.00 if newPrice < 0
      $price.html("$#{newPrice.toFixed(2)}")
      $(".cc-info").hide() if newPrice == 0.00
