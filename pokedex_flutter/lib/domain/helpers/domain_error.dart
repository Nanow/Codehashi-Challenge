enum DomainError { unexpected }

extension DomainErrorExtension on DomainError {
  String get description {
    return "Algo errado aconteceu, tente novamente em breve.";
  }
}
