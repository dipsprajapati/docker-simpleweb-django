from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect
from django.views.generic import TemplateView


# Create your views here.

class HomePage(TemplateView):
    template_name = 'index.html'

#  def HomePage(request):
#     "#Number of visits to this view, as counted in the session variable."
#     num_visits = request.session.get('num_visits', 0)
#     request.session['num_visits'] = num_visits + 1
#     context = {'num_visits': num_visits
#     }
#     return render(request,'home.html',context=context)
