% include('header_local.tpl')

<div class="container">
    <div class="row">
        <div class="col-12 col-sm-12 col-md-12 col-lg-10 offset-lg-1 col-xl-8 offset-xl-2">
            <h1 class="text-center">#bettertogether</h1>
            <br/>
            <p class="lead text-center"><strong>{{student_1}}</strong>, here's how your <strong>Assignment {{assignment}}</strong> compares with <strong>{{student_2}}</strong>'s:</p>
        </div>
    </div>
    <div class="row">
        <div class="col-12 col-sm-12 col-md-12 col-lg-10 offset-lg-1 col-xl-8 offset-xl-2">
            <div class="row">
                <div class="col-6">
                    <table class="table table-sm small">
                        <thead>
                        <tr class="d-flex">
                            <th scope="col" class="col-9">{{student_1}}'s main topics:</th>
                            <th scope="col" class="col-3 text-right">
                                <span class="d-none d-sm-block">Relevance </span>
                                <span class="d-block d-sm-none">Rel. </span>
                                score
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        % for index, item in enumerate(entities_1):
                        <tr class="d-flex">
                            <td class="col-9">{{item.id}}</td>
                            <td class="col-3 text-right">{{"{0:.4f}".format(item.relevance_score)}}</td>
                        </tr>
                        % end
                        </tbody>
                    </table>
                </div>
                <div class="col-6">
                    <table class="table table-sm small">
                        <thead>
                        <tr class="d-flex">
                            <th scope="col" class="col-9">{{student_2}}'s main topics:</th>
                            <th scope="col" class="col-3 text-right">
                                <span class="d-none d-sm-block">Relevance </span>
                                <span class="d-block d-sm-none">Rel. </span>
                                score
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        % for index, item in enumerate(entities_2):
                        <tr class="d-flex">
                            <td class="col-9">{{item.id}}</td>
                            <td class="col-3 text-right">{{"{0:.4f}".format(item.relevance_score)}}</td>
                        </tr>
                        % end
                        </tbody>
                    </table>

                </div>
            </div>
        </div>

    </div>
    <div class="row">
        <div class="col-12 col-sm-12 col-md-12 col-lg-10 offset-lg-1 col-xl-8 offset-xl-2">
            <p class="lead text-center">This uses <a href="https://www.textrazor.com/">TextRazor</a>'s API. Check <a href="#">the tutorial</a> to see how to it is used.</p>
            <br/>
            <p class="lead text-center">
                <a role="button" class="btn btn-outline-primary btn-lg" href="javascript:history.back()">Go Back!</a>
                <a role="button" class="btn btn-outline-primary btn-lg" href="/motivation">Motivation</a>
                <a role="button" class="btn btn-outline-primary btn-lg" href="https://github.com/ucals/bettertogether/blob/master/tutorial.ipynb" target="_blank" rel="noopener noreferrer">Tutorial</a>
                <a role="button" class="btn btn-outline-primary btn-lg" href="https://goo.gl/forms/alQDVr3lmOUwvouE2" target="_blank" rel="noopener noreferrer">Feedback</a>
            </p>
            <p class="text-center">Created by <a href="mailto:souza@gatech.edu">Carlos Souza</a><p>
        </div>
    </div>
</div>

% include('footer.tpl')