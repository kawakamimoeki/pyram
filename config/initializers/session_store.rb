Rails.application.config.session_store :cookie_store, key: '_user_id_session', expire_after: 1.month
Rails.application.config.session_store :cookie_store, key: '_book_id_session', expire_after: 1.month
