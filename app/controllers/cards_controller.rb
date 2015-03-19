class CardsController < ApplicationController
  def index
    @card = Card.all
  end

  def new
    @card = Card.new
    new_card
  end

  def create
    @card = Card.new(card_params)

    if @card.save
      redirect_to cards_path
    else
      new_card
      render 'new'
    end
  end

  def update
    @card = Card.find(params[:id])

    if @card.update(card_params)
      redirect_to cards_path
    else
      edit_card
      render 'new'
    end
  end

  def edit
    @card = Card.find(params[:id])
    edit_card
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy

    redirect_to cards_path
  end

private
  def card_params
    params.require(:card).permit(:original_text, :translated_text)
  end

  def new_card
    @btn = "btn-info"
    @header = "card__heading card__heading_new"
    @title = "Создание карточки"
  end

  def edit_card
    @btn = "btn-warning"
    @header = "card__heading card__heading_edit"
    @title = "Редактирование карточки"
  end
end
