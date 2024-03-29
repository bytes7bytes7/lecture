const institution = 'kubsu';
const lecture = 'lecture';
const alSubjects = 'all_subjects';

const id = 'id';
const faculty = 'faculty';
const level = 'level';
const subject = 'subject';
const semester = 'semester';
const topic = 'topic';
const content = 'content';
const lecturer = 'lecturer';
const date = 'date';
const rating = 'rating';
const author = 'author';
const text = 'text';
const photos = 'photos';
const videos = 'videos';

const login = 'phone';
const password = 'password';
const token = 'token';
const code = 'code';

const firstName = 'first_name';
const middleName = 'middle_name';
const lastName = 'last_name';
const avatar = 'avatar';
const error = 'error';
const details = 'details';
const detail = 'detail';
const statusCode = 'status_code';
const message = 'message';
const verified = 'verified';
const refresh = 'refresh';
const access = 'access';
const sentEmail = 'sent_email';

class Details {
  Details._();

  static const noAccount = 'No active account found with the given credentials';
  static const loginAlreadyInUse = 'user with this phone already exists.';
  static const notValidLogin = 'The phone number entered is not valid.';
  static const shortPassword =
      'This password is too short. It must contain at least 8 characters.';
  static const commonPassword = 'This password is too common.';
  static const numericPassword = 'This password is entirely numeric.';
  static const emptyField = 'This field may not be null.';
  static const wrongOrInvalidToken = 'Token is invalid or expired';
}
