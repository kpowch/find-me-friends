import React from 'react';
import ReactDOM from 'react-dom';

class Sidebar extends React.Component {

  render() {
    return (
      <div className="sidebar">
        <div>
          Sidebar!
        </div>
        <div className="sidebar-name">
          {this.props.user.name}
        </div>
        <div className="sidebar-bio">
          {this.props.user.bio}
        </div>
      </div>
    );
  }
}

export default Sidebar;