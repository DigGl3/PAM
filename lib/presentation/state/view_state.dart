/// Starea unui ecran care încarcă date asincron.
sealed class ViewState<T> {
  const ViewState();
}

/// Datele se încarcă (se afișează loader-ul).
class LoadingState<T> extends ViewState<T> {
  const LoadingState();
}

/// Datele au sosit cu succes.
class ContentState<T> extends ViewState<T> {
  const ContentState(this.data);
  final T data;
}

/// A apărut o eroare (se afișează mesajul și butonul „Reîncearcă”).
class ErrorState<T> extends ViewState<T> {
  const ErrorState(this.message);
  final String message;
}
