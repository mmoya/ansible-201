from subprocess import CalledProcessError, call, check_output
import sys

def is_rev_a_ancestor_of_b(a, b):
    # return False

    reachable = False
    try:
        check_output('git', 'merge-base', '--is-ancestor', a, b)
        reachable = True
    except CalledProcessError:
        pass

    return reachable

class CallbackModule(object):

    def playbook_on_start(self, *args, **kwargs):
        call(['git', 'fetch', '--quiet'])

        if not is_rev_a_ancestor_of_b('origin/master', 'HEAD'):
            sys.exit(1)
