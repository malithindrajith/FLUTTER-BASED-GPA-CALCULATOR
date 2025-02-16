// Inside InputScreen's _submitForm method
void _submitForm() {
  if (_formKey.currentState!.validate()) {
    _formKey.currentState!.save();
    double totalCredits = 0;
    double totalGradePoints = 0;

    for (var course in courses) {
      int credits = course['credits'];
      String grade = course['grade'];
      double gradePoint = _getGradePoint(grade);
      totalCredits += credits;
      totalGradePoints += credits * gradePoint;
    }

    double gpa = totalGradePoints / totalCredits;

    // Navigate to ResultScreen with the calculated GPA
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(gpa: gpa),
      ),
    );
  }
}