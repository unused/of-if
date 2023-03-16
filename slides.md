---
# vim: set ft=markdown:
author: Christoph Lipautz
title: Of If
subtitle: and other conditionals
theme: Copenhagen
colortheme: beaver
date: \today
keywords: ['conditionals', 'of-if', 'presentation']
---

# /if 1/2

root of much evil (code)

# /if 2/2

think twice, split brain

# refactor 1/2

```ruby
if user
  "Welcome #{user.name}"
else
  "Welcome Visitor"
end
```

# refactor 2/2

```ruby
class GuestUser
  def name = "Visitor"
end
```

# guard

```ruby
class Dividend

  def div(divisor)
    raise ArgumentError, "nooo, zero!!!" if divisor.zero?

    to_i / divisor
  end
end
```

# of-if

indentation is a cheap indicator of code quality

# ?

![](of-if/lib_of_if_version.png)

# of_if/lib/of_if/version.rb

![](of-if/lib_of_if_version.png)

# ?

![](of-if/examples_pundit_lib_pundit_authorization.png)

# pundit/lib/pundit/authorization.rb

![](of-if/examples_pundit_lib_pundit_authorization.png)

# ?

![](of-if/examples_stripe_lib_stripe_stripe_response.png)

# stripe/lib/stripe/stripe_response.rb

![](of-if/examples_stripe_lib_stripe_stripe_response.png)

# ?

![](of-if/examples_rails_activesupport_lib_active_support_duration.png)

# rails/activesupport/lib/active_support/duration.rb

![](of-if/examples_rails_activesupport_lib_active_support_duration.png)

# rubygem: of_if

[github.com/unused/of-if](https://github.com/unused/of-if)

