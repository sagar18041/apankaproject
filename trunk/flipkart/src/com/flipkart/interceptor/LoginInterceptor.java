package com.flipkart.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ValidationAware;
import com.opensymphony.xwork2.interceptor.Interceptor;

@SuppressWarnings("serial")
public class LoginInterceptor implements Interceptor {

    public void destroy() {
//        throw new UnsupportedOperationException("Not supported yet.");
    }

    public void init() {
//        throw new UnsupportedOperationException("Not supported yet.");
    }

    @SuppressWarnings({ "rawtypes", "unchecked" })
	public String intercept(ActionInvocation ai) throws Exception {
        ai.getInvocationContext();
		Map sess = ActionContext.getContext().getSession();
        if (sess.containsKey("login")) {
            return ai.invoke();
        }
        Object action = ai.getAction();
        if (action instanceof ValidationAware) {
            ((ValidationAware) action).addActionError("Unauthorized access. " +
            		"Please Login first.");
            sess.put("hasErrors", 1);
            sess.put("errorForm", "login");
            sess.put("errorMsg", "Please Login first");
        }
        return "login";
    }
}
