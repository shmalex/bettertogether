from bottle import route, run, template, get, post, request
from bottle import static_file, redirect
from api import get_students, get_similar_docs, initialize_textrazor, get_top_entities
import logging
import sys


title = "#bettertogether"
logging.basicConfig(stream=sys.stdout, level=logging.DEBUG)
textrazor_client = initialize_textrazor()


@route('/')
def welcome():
    return template('welcome', title=title)


@get('/inputs')
def inputs():
    info = {'title': title, 'students': get_students()}
    return template('inputs', info)


@post('/plot')
def formhandler():
    student = request.forms.get('student')
    assignment = request.forms.get('assignment')
    similar_docs = get_similar_docs(student, assignment)
    if len(similar_docs) == 0:
        redirect("/error/" + str(assignment) + '/' + student)
    else:
        info = {'student': student, 'assignment': assignment, 'similar_docs': similar_docs}
        return template('plot', info)


@route('/compare/<assignment>/<student_1>/<student_2>')
def user_api(assignment, student_1, student_2):
    entities_1 = get_top_entities(student_1, assignment, textrazor_client=textrazor_client)
    entities_2 = get_top_entities(student_2, assignment, textrazor_client=textrazor_client)
    info = {'assignment': assignment,
            'student_1': student_1,
            'entities_1': entities_1,
            'file_1': '/pdfs/' + student_1 + ' - Assignment ' + assignment + '.pdf',
            'student_2': student_2,
            'entities_2': entities_2,
            'file_2': '/pdfs/' + student_2 + ' - Assignment ' + assignment + '.pdf'}
    return template('compare', info)


@route('/motivation')
def motivation():
    return template('motivation', title=title)


@route('/error/<assignment>/<student>')
def error(assignment, student):
    info = {'assignment': assignment, 'student': student}
    return template('error', info)


@route('/static/<filepath:path>')
def server_static(filepath):
    return static_file(filepath, root='static')


@route('/pdfs/<path>')
def server_static(path):
    return static_file(path, root='pdfs')


if __name__ == '__main__':
    run(host='0.0.0.0', port=8080)
