class Api::V1::SongsController < ApplicationController
  # renderiza todos os registros da tabela songs
  def index
    songs = Song.all
    render json: songs, status: 200
  end

  # permite criar um novo registro na tabela songs
  # se o registro for criado com sucesso, renderiza o registro criado
  # se o registro não for criado com sucesso, renderiza o erro
  def create
    song = Song.new(
      name: song_params[:name],
      album: song_params[:album],
      artist: song_params[:artist]
    )
    if song.save
      render json: song, status: 201
    else
      render json: { error: 'Error' }
    end
  end

  # renderiza o registro com o id passado por parâmetro
  # se o registro não for encontrado, renderiza o erro
  def show
    song = Song.find_by(id: params[:id])
    if song
      render json: song, status: 200
    else
      render json: { error: 'Song not found' }, status: 404
    end
  end

  # método privado que está apenas disponível para esse controller
  private

  def song_params
    params.require(:song).permit(%i[
                                   name
                                   album
                                   artist
                                 ])
  end
end
