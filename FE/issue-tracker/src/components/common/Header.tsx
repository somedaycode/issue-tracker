import styled from 'styled-components';
import { Link } from 'react-router-dom';
import { Avatar } from '@chakra-ui/react';
import { ReactComponent as LogotypeMedium } from '@assets/LogotypeMedium.svg';

function Header() {
  const loginInfo = localStorage.getItem('login_info');
  let avatar_url = '';
  if (loginInfo != null) {
    avatar_url = JSON.parse(loginInfo).avatar_url;
  }

  return (
    <HeaderContainer>
      <Link to="/issues">
        <LogotypeMedium className="logo" />
      </Link>
      <Avatar size="md" src={avatar_url} />
    </HeaderContainer>
  );
}

export default Header;

const HeaderContainer = styled.div`
  width: 100%;
  height: 94px;
  margin-bottom: 32px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  .logo {
    width: 200px;
  }
`;
