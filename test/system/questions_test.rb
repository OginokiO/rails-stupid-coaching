# test/system/questions_test.rb
require "application_system_test_case"

class QuestionsTest < ApplicationSystemTestCase
  test "visiting /ask renders the form" do
    visit ask_url                    # Ir a la página /ask
    assert_selector "h1", text: "Ask your coach anything"  # Verificar que aparece el título
  end

  test "saying Hello yields a grumpy response from the coach" do
    visit ask_url                    # Ir al formulario
    fill_in "question", with: "Hello"  # Escribir "Hello" en el input
    click_on "Ask"                    # Hacer clic en el botón "Ask!"

    assert_text "I don't care, get dressed and go to work!"  # Verificar la respuesta
  end
end
