class EditorException implements Exception {
  const EditorException();

  const factory EditorException.noDraftFound() = NoDraftFound;

  const factory EditorException.notAddedDraft() = NotAddedDraft;
}

class NoDraftFound extends EditorException {
  const NoDraftFound();
}

class NotAddedDraft extends EditorException {
  const NotAddedDraft();
}
