class GameController < ApplicationController
  def play
    gon.push({
      bB: ActionController::Base.helpers.image_path('chessboard/chesspieces/wikipedia/bB'),
      bK: ActionController::Base.helpers.image_path('chessboard/chesspieces/wikipedia/bK'),
      bN: ActionController::Base.helpers.image_path('chessboard/chesspieces/wikipedia/bN'),
      bP: ActionController::Base.helpers.image_path('chessboard/chesspieces/wikipedia/bP'),
      bQ: ActionController::Base.helpers.image_path('chessboard/chesspieces/wikipedia/bQ'),
      bR: ActionController::Base.helpers.image_path('chessboard/chesspieces/wikipedia/bR'),
      wB: ActionController::Base.helpers.image_path('chessboard/chesspieces/wikipedia/wR'),
      wK: ActionController::Base.helpers.image_path('chessboard/chesspieces/wikipedia/wK'),
      wN: ActionController::Base.helpers.image_path('chessboard/chesspieces/wikipedia/wN'),
      wP: ActionController::Base.helpers.image_path('chessboard/chesspieces/wikipedia/wP'),
      wQ: ActionController::Base.helpers.image_path('chessboard/chesspieces/wikipedia/wQ'),
      wR: ActionController::Base.helpers.image_path('chessboard/chesspieces/wikipedia/wR')
    })
  end
end
