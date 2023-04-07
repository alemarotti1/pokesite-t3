import { NextPage } from "next";

interface Props { }

const SignIn: NextPage = (Props) : JSX.Element => {
    return (
        <form method="post" action="/api/auth/callback/credentials">
            <input name="csrfToken" type="hidden" defaultValue="csrfToken" />
            <label>
                User
                <input name="username" type="text" />
            </label>
            <label>
                Password
                <input name="password" type="password" />
            </label>
            <button type="submit">Sign in</button>
        </form>
    );
};

export default SignIn;