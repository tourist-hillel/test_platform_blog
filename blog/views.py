from django.shortcuts import render, get_object_or_404, redirect
from django.views.generic import ListView, DetailView, CreateView
from django.urls import reverse_lazy
from .models import Post, Comment


class PostListView(ListView):
    model = Post
    template_name = 'blog/post_list.html'
    context_object_name = 'posts'
    paginate_by = 10
    
    def get_queryset(self):
        return Post.objects.all()


class PostDetailView(DetailView):
    model = Post
    template_name = 'blog/post_detail.html'
    context_object_name = 'post'


def add_comment(request, post_id):
    post = get_object_or_404(Post, id=post_id)
    
    if request.method == 'POST':
        author_name = request.POST.get('author_name')
        email = request.POST.get('email')
        content = request.POST.get('content')
        
        Comment.objects.create(
            post=post,
            author_name=author_name,
            email=email,
            content=content
        )
        
        return redirect('post_detail', pk=post.id)
    
    return redirect('post_list')


def home_view(request):
    return render(request, 'home.html')
