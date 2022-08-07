class EditorException implements Exception {
  const EditorException();

  const factory EditorException.noDraftFound() = NoDraftFound;
}

class NoDraftFound extends EditorException {
  const NoDraftFound();
}
